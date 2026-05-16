package sdktest

import (
	"encoding/json"
	"os"
	"path/filepath"
	"runtime"
	"strings"
	"testing"
	"time"

	sdk "github.com/voxgig-sdk/no-as-a-service-two-sdk"
	"github.com/voxgig-sdk/no-as-a-service-two-sdk/core"

	vs "github.com/voxgig/struct"
)

func TestRejectionReasonEntity(t *testing.T) {
	t.Run("instance", func(t *testing.T) {
		testsdk := sdk.TestSDK(nil, nil)
		ent := testsdk.RejectionReason(nil)
		if ent == nil {
			t.Fatal("expected non-nil RejectionReasonEntity")
		}
	})

	t.Run("basic", func(t *testing.T) {
		setup := rejection_reasonBasicSetup(nil)
		// Per-op sdk-test-control.json skip — basic test exercises a flow
		// with multiple ops; skipping any op skips the whole flow.
		_mode := "unit"
		if setup.live {
			_mode = "live"
		}
		for _, _op := range []string{"load"} {
			if _shouldSkip, _reason := isControlSkipped("entityOp", "rejection_reason." + _op, _mode); _shouldSkip {
				if _reason == "" {
					_reason = "skipped via sdk-test-control.json"
				}
				t.Skip(_reason)
				return
			}
		}
		// The basic flow consumes synthetic IDs from the fixture. In live mode
		// without an *_ENTID env override, those IDs hit the live API and 4xx.
		if setup.syntheticOnly {
			t.Skip("live entity test uses synthetic IDs from fixture — set NOASASERVICETWO_TEST_REJECTION_REASON_ENTID JSON to run live")
			return
		}
		client := setup.client

		// Bootstrap entity data from existing test data (no create step in flow).
		rejectionReasonRef01DataRaw := vs.Items(core.ToMapAny(vs.GetPath("existing.rejection_reason", setup.data)))
		var rejectionReasonRef01Data map[string]any
		if len(rejectionReasonRef01DataRaw) > 0 {
			rejectionReasonRef01Data = core.ToMapAny(rejectionReasonRef01DataRaw[0][1])
		}
		// Discard guards against Go's unused-var check when the flow's steps
		// happen not to consume the bootstrap data (e.g. list-only flows).
		_ = rejectionReasonRef01Data

		// LOAD
		rejectionReasonRef01Ent := client.RejectionReason(nil)
		rejectionReasonRef01MatchDt0 := map[string]any{}
		rejectionReasonRef01DataDt0Loaded, err := rejectionReasonRef01Ent.Load(rejectionReasonRef01MatchDt0, nil)
		if err != nil {
			t.Fatalf("load failed: %v", err)
		}
		if rejectionReasonRef01DataDt0Loaded == nil {
			t.Fatal("expected load result to be non-nil")
		}

	})
}

func rejection_reasonBasicSetup(extra map[string]any) *entityTestSetup {
	loadEnvLocal()

	_, filename, _, _ := runtime.Caller(0)
	dir := filepath.Dir(filename)

	entityDataFile := filepath.Join(dir, "..", "..", ".sdk", "test", "entity", "rejection_reason", "RejectionReasonTestData.json")

	entityDataSource, err := os.ReadFile(entityDataFile)
	if err != nil {
		panic("failed to read rejection_reason test data: " + err.Error())
	}

	var entityData map[string]any
	if err := json.Unmarshal(entityDataSource, &entityData); err != nil {
		panic("failed to parse rejection_reason test data: " + err.Error())
	}

	options := map[string]any{}
	options["entity"] = entityData["existing"]

	client := sdk.TestSDK(options, extra)

	// Generate idmap via transform, matching TS pattern.
	idmap := vs.Transform(
		[]any{"rejection_reason01", "rejection_reason02", "rejection_reason03"},
		map[string]any{
			"`$PACK`": []any{"", map[string]any{
				"`$KEY`": "`$COPY`",
				"`$VAL`": []any{"`$FORMAT`", "upper", "`$COPY`"},
			}},
		},
	)

	// Detect ENTID env override before envOverride consumes it. When live
	// mode is on without a real override, the basic test runs against synthetic
	// IDs from the fixture and 4xx's. Surface this so the test can skip.
	entidEnvRaw := os.Getenv("NOASASERVICETWO_TEST_REJECTION_REASON_ENTID")
	idmapOverridden := entidEnvRaw != "" && strings.HasPrefix(strings.TrimSpace(entidEnvRaw), "{")

	env := envOverride(map[string]any{
		"NOASASERVICETWO_TEST_REJECTION_REASON_ENTID": idmap,
		"NOASASERVICETWO_TEST_LIVE":      "FALSE",
		"NOASASERVICETWO_TEST_EXPLAIN":   "FALSE",
		"NOASASERVICETWO_APIKEY":         "NONE",
	})

	idmapResolved := core.ToMapAny(env["NOASASERVICETWO_TEST_REJECTION_REASON_ENTID"])
	if idmapResolved == nil {
		idmapResolved = core.ToMapAny(idmap)
	}

	if env["NOASASERVICETWO_TEST_LIVE"] == "TRUE" {
		mergedOpts := vs.Merge([]any{
			map[string]any{
				"apikey": env["NOASASERVICETWO_APIKEY"],
			},
			extra,
		})
		client = sdk.NewNoAsAServiceTwoSDK(core.ToMapAny(mergedOpts))
	}

	live := env["NOASASERVICETWO_TEST_LIVE"] == "TRUE"
	return &entityTestSetup{
		client:        client,
		data:          entityData,
		idmap:         idmapResolved,
		env:           env,
		explain:       env["NOASASERVICETWO_TEST_EXPLAIN"] == "TRUE",
		live:          live,
		syntheticOnly: live && !idmapOverridden,
		now:           time.Now().UnixMilli(),
	}
}

package sdktest

import (
	"encoding/json"
	"os"
	"strings"
	"testing"

	sdk "github.com/voxgig-sdk/no-as-a-service-two-sdk"
	"github.com/voxgig-sdk/no-as-a-service-two-sdk/core"
)

func TestRejectionReasonDirect(t *testing.T) {
	t.Run("direct-load-rejection_reason", func(t *testing.T) {
		setup := rejection_reasonDirectSetup(map[string]any{"id": "direct01"})
		_mode := "unit"
		if setup.live {
			_mode = "live"
		}
		if _shouldSkip, _reason := isControlSkipped("direct", "direct-load-rejection_reason", _mode); _shouldSkip {
			if _reason == "" {
				_reason = "skipped via sdk-test-control.json"
			}
			t.Skip(_reason)
			return
		}
		client := setup.client


		result, err := client.Direct(map[string]any{
			"path":   "no",
			"method": "GET",
			"params": map[string]any{},
		})
		if setup.live {
			// Live mode is lenient: synthetic IDs frequently 4xx. Skip
			// rather than fail when the load endpoint isn't reachable with
			// the IDs we can construct from setup.idmap.
			if err != nil {
				t.Skipf("load call failed (likely synthetic IDs against live API): %v", err)
			}
			if result["ok"] != true {
				t.Skipf("load call not ok (likely synthetic IDs against live API): %v", result)
			}
			status := core.ToInt(result["status"])
			if status < 200 || status >= 300 {
				t.Skipf("expected 2xx status, got %v", result["status"])
			}
		} else {
			if err != nil {
				t.Fatalf("direct failed: %v", err)
			}
			if result["ok"] != true {
				t.Fatalf("expected ok to be true, got %v", result["ok"])
			}
			if core.ToInt(result["status"]) != 200 {
				t.Fatalf("expected status 200, got %v", result["status"])
			}
			if result["data"] == nil {
				t.Fatal("expected data to be non-nil")
			}
		}

		if !setup.live {
			if dataMap, ok := result["data"].(map[string]any); ok {
				if dataMap["id"] != "direct01" {
					t.Fatalf("expected data.id to be direct01, got %v", dataMap["id"])
				}
			}

			if len(*setup.calls) != 1 {
				t.Fatalf("expected 1 call, got %d", len(*setup.calls))
			}
			call := (*setup.calls)[0]
			if initMap, ok := call["init"].(map[string]any); ok {
				if initMap["method"] != "GET" {
					t.Fatalf("expected method GET, got %v", initMap["method"])
				}
			}
			if _, ok := call["url"].(string); ok {
			}
		}
	})

}

type rejection_reasonDirectSetupResult struct {
	client *sdk.NoAsAServiceTwoSDK
	calls  *[]map[string]any
	live   bool
	idmap  map[string]any
}

func rejection_reasonDirectSetup(mockres any) *rejection_reasonDirectSetupResult {
	loadEnvLocal()

	calls := &[]map[string]any{}

	env := envOverride(map[string]any{
		"NOASASERVICETWO_TEST_REJECTION_REASON_ENTID": map[string]any{},
		"NOASASERVICETWO_TEST_LIVE":    "FALSE",
		"NOASASERVICETWO_APIKEY":       "NONE",
	})

	live := env["NOASASERVICETWO_TEST_LIVE"] == "TRUE"

	if live {
		mergedOpts := map[string]any{
			"apikey": env["NOASASERVICETWO_APIKEY"],
		}
		client := sdk.NewNoAsAServiceTwoSDK(mergedOpts)

		idmap := map[string]any{}
		if entidRaw, ok := env["NOASASERVICETWO_TEST_REJECTION_REASON_ENTID"]; ok {
			if entidStr, ok := entidRaw.(string); ok && strings.HasPrefix(entidStr, "{") {
				json.Unmarshal([]byte(entidStr), &idmap)
			} else if entidMap, ok := entidRaw.(map[string]any); ok {
				idmap = entidMap
			}
		}

		return &rejection_reasonDirectSetupResult{client: client, calls: calls, live: true, idmap: idmap}
	}

	mockFetch := func(url string, init map[string]any) (map[string]any, error) {
		*calls = append(*calls, map[string]any{"url": url, "init": init})
		return map[string]any{
			"status":     200,
			"statusText": "OK",
			"headers":    map[string]any{},
			"json": (func() any)(func() any {
				if mockres != nil {
					return mockres
				}
				return map[string]any{"id": "direct01"}
			}),
		}, nil
	}

	client := sdk.NewNoAsAServiceTwoSDK(map[string]any{
		"base": "http://localhost:8080",
		"system": map[string]any{
			"fetch": (func(string, map[string]any) (map[string]any, error))(mockFetch),
		},
	})

	return &rejection_reasonDirectSetupResult{client: client, calls: calls, live: false, idmap: map[string]any{}}
}

var _ = os.Getenv
var _ = json.Unmarshal

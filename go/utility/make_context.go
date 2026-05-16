package utility

import "github.com/voxgig-sdk/no-as-a-service-two-sdk/core"

func makeContextUtil(ctxmap map[string]any, basectx *core.Context) *core.Context {
	return core.NewContext(ctxmap, basectx)
}

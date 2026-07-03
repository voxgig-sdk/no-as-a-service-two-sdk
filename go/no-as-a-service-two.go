package voxgignoasaservicetwosdk

import (
	"github.com/voxgig-sdk/no-as-a-service-two-sdk/go/core"
	"github.com/voxgig-sdk/no-as-a-service-two-sdk/go/entity"
	"github.com/voxgig-sdk/no-as-a-service-two-sdk/go/feature"
	_ "github.com/voxgig-sdk/no-as-a-service-two-sdk/go/utility"
)

// Type aliases preserve external API.
type NoAsAServiceTwoSDK = core.NoAsAServiceTwoSDK
type Context = core.Context
type Utility = core.Utility
type Feature = core.Feature
type Entity = core.Entity
type NoAsAServiceTwoEntity = core.NoAsAServiceTwoEntity
type FetcherFunc = core.FetcherFunc
type Spec = core.Spec
type Result = core.Result
type Response = core.Response
type Operation = core.Operation
type Control = core.Control
type NoAsAServiceTwoError = core.NoAsAServiceTwoError

// BaseFeature from feature package.
type BaseFeature = feature.BaseFeature

func init() {
	core.NewBaseFeatureFunc = func() core.Feature {
		return feature.NewBaseFeature()
	}
	core.NewTestFeatureFunc = func() core.Feature {
		return feature.NewTestFeature()
	}
	core.NewRejectionReasonEntityFunc = func(client *core.NoAsAServiceTwoSDK, entopts map[string]any) core.NoAsAServiceTwoEntity {
		return entity.NewRejectionReasonEntity(client, entopts)
	}
}

// Constructor re-exports.
var NewNoAsAServiceTwoSDK = core.NewNoAsAServiceTwoSDK
var TestSDK = core.TestSDK
var NewContext = core.NewContext
var NewSpec = core.NewSpec
var NewResult = core.NewResult
var NewResponse = core.NewResponse
var NewOperation = core.NewOperation
var MakeConfig = core.MakeConfig

// No-arg convenience constructors. Go has no default-argument syntax,
// so these aliases let callers write `sdk.New()` / `sdk.Test()`
// instead of `sdk.NewNoAsAServiceTwoSDK(nil)` / `sdk.TestSDK(nil, nil)`
// for the common no-options case.
func New() *NoAsAServiceTwoSDK  { return NewNoAsAServiceTwoSDK(nil) }
func Test() *NoAsAServiceTwoSDK { return TestSDK(nil, nil) }
var NewBaseFeature = feature.NewBaseFeature
var NewTestFeature = feature.NewTestFeature

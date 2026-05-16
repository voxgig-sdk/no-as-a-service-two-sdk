package core

var UtilityRegistrar func(u *Utility)

var NewBaseFeatureFunc func() Feature

var NewTestFeatureFunc func() Feature

var NewRejectionReasonEntityFunc func(client *NoAsAServiceTwoSDK, entopts map[string]any) NoAsAServiceTwoEntity


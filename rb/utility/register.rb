# NoAsAServiceTwo SDK utility registration
require_relative '../core/utility_type'
require_relative 'clean'
require_relative 'done'
require_relative 'make_error'
require_relative 'feature_add'
require_relative 'feature_hook'
require_relative 'feature_init'
require_relative 'fetcher'
require_relative 'make_fetch_def'
require_relative 'make_context'
require_relative 'make_options'
require_relative 'make_request'
require_relative 'make_response'
require_relative 'make_result'
require_relative 'make_point'
require_relative 'make_spec'
require_relative 'make_url'
require_relative 'param'
require_relative 'prepare_auth'
require_relative 'prepare_body'
require_relative 'prepare_headers'
require_relative 'prepare_method'
require_relative 'prepare_params'
require_relative 'prepare_path'
require_relative 'prepare_query'
require_relative 'result_basic'
require_relative 'result_body'
require_relative 'result_headers'
require_relative 'transform_request'
require_relative 'transform_response'

NoAsAServiceTwoUtility.registrar = ->(u) {
  u.clean = NoAsAServiceTwoUtilities::Clean
  u.done = NoAsAServiceTwoUtilities::Done
  u.make_error = NoAsAServiceTwoUtilities::MakeError
  u.feature_add = NoAsAServiceTwoUtilities::FeatureAdd
  u.feature_hook = NoAsAServiceTwoUtilities::FeatureHook
  u.feature_init = NoAsAServiceTwoUtilities::FeatureInit
  u.fetcher = NoAsAServiceTwoUtilities::Fetcher
  u.make_fetch_def = NoAsAServiceTwoUtilities::MakeFetchDef
  u.make_context = NoAsAServiceTwoUtilities::MakeContext
  u.make_options = NoAsAServiceTwoUtilities::MakeOptions
  u.make_request = NoAsAServiceTwoUtilities::MakeRequest
  u.make_response = NoAsAServiceTwoUtilities::MakeResponse
  u.make_result = NoAsAServiceTwoUtilities::MakeResult
  u.make_point = NoAsAServiceTwoUtilities::MakePoint
  u.make_spec = NoAsAServiceTwoUtilities::MakeSpec
  u.make_url = NoAsAServiceTwoUtilities::MakeUrl
  u.param = NoAsAServiceTwoUtilities::Param
  u.prepare_auth = NoAsAServiceTwoUtilities::PrepareAuth
  u.prepare_body = NoAsAServiceTwoUtilities::PrepareBody
  u.prepare_headers = NoAsAServiceTwoUtilities::PrepareHeaders
  u.prepare_method = NoAsAServiceTwoUtilities::PrepareMethod
  u.prepare_params = NoAsAServiceTwoUtilities::PrepareParams
  u.prepare_path = NoAsAServiceTwoUtilities::PreparePath
  u.prepare_query = NoAsAServiceTwoUtilities::PrepareQuery
  u.result_basic = NoAsAServiceTwoUtilities::ResultBasic
  u.result_body = NoAsAServiceTwoUtilities::ResultBody
  u.result_headers = NoAsAServiceTwoUtilities::ResultHeaders
  u.transform_request = NoAsAServiceTwoUtilities::TransformRequest
  u.transform_response = NoAsAServiceTwoUtilities::TransformResponse
}

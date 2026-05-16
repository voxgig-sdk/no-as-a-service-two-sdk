<?php
declare(strict_types=1);

// NoAsAServiceTwo SDK utility registration

require_once __DIR__ . '/../core/UtilityType.php';
require_once __DIR__ . '/Clean.php';
require_once __DIR__ . '/Done.php';
require_once __DIR__ . '/MakeError.php';
require_once __DIR__ . '/FeatureAdd.php';
require_once __DIR__ . '/FeatureHook.php';
require_once __DIR__ . '/FeatureInit.php';
require_once __DIR__ . '/Fetcher.php';
require_once __DIR__ . '/MakeFetchDef.php';
require_once __DIR__ . '/MakeContext.php';
require_once __DIR__ . '/MakeOptions.php';
require_once __DIR__ . '/MakeRequest.php';
require_once __DIR__ . '/MakeResponse.php';
require_once __DIR__ . '/MakeResult.php';
require_once __DIR__ . '/MakePoint.php';
require_once __DIR__ . '/MakeSpec.php';
require_once __DIR__ . '/MakeUrl.php';
require_once __DIR__ . '/Param.php';
require_once __DIR__ . '/PrepareAuth.php';
require_once __DIR__ . '/PrepareBody.php';
require_once __DIR__ . '/PrepareHeaders.php';
require_once __DIR__ . '/PrepareMethod.php';
require_once __DIR__ . '/PrepareParams.php';
require_once __DIR__ . '/PreparePath.php';
require_once __DIR__ . '/PrepareQuery.php';
require_once __DIR__ . '/ResultBasic.php';
require_once __DIR__ . '/ResultBody.php';
require_once __DIR__ . '/ResultHeaders.php';
require_once __DIR__ . '/TransformRequest.php';
require_once __DIR__ . '/TransformResponse.php';

NoAsAServiceTwoUtility::setRegistrar(function (NoAsAServiceTwoUtility $u): void {
    $u->clean = [NoAsAServiceTwoClean::class, 'call'];
    $u->done = [NoAsAServiceTwoDone::class, 'call'];
    $u->make_error = [NoAsAServiceTwoMakeError::class, 'call'];
    $u->feature_add = [NoAsAServiceTwoFeatureAdd::class, 'call'];
    $u->feature_hook = [NoAsAServiceTwoFeatureHook::class, 'call'];
    $u->feature_init = [NoAsAServiceTwoFeatureInit::class, 'call'];
    $u->fetcher = [NoAsAServiceTwoFetcher::class, 'call'];
    $u->make_fetch_def = [NoAsAServiceTwoMakeFetchDef::class, 'call'];
    $u->make_context = [NoAsAServiceTwoMakeContext::class, 'call'];
    $u->make_options = [NoAsAServiceTwoMakeOptions::class, 'call'];
    $u->make_request = [NoAsAServiceTwoMakeRequest::class, 'call'];
    $u->make_response = [NoAsAServiceTwoMakeResponse::class, 'call'];
    $u->make_result = [NoAsAServiceTwoMakeResult::class, 'call'];
    $u->make_point = [NoAsAServiceTwoMakePoint::class, 'call'];
    $u->make_spec = [NoAsAServiceTwoMakeSpec::class, 'call'];
    $u->make_url = [NoAsAServiceTwoMakeUrl::class, 'call'];
    $u->param = [NoAsAServiceTwoParam::class, 'call'];
    $u->prepare_auth = [NoAsAServiceTwoPrepareAuth::class, 'call'];
    $u->prepare_body = [NoAsAServiceTwoPrepareBody::class, 'call'];
    $u->prepare_headers = [NoAsAServiceTwoPrepareHeaders::class, 'call'];
    $u->prepare_method = [NoAsAServiceTwoPrepareMethod::class, 'call'];
    $u->prepare_params = [NoAsAServiceTwoPrepareParams::class, 'call'];
    $u->prepare_path = [NoAsAServiceTwoPreparePath::class, 'call'];
    $u->prepare_query = [NoAsAServiceTwoPrepareQuery::class, 'call'];
    $u->result_basic = [NoAsAServiceTwoResultBasic::class, 'call'];
    $u->result_body = [NoAsAServiceTwoResultBody::class, 'call'];
    $u->result_headers = [NoAsAServiceTwoResultHeaders::class, 'call'];
    $u->transform_request = [NoAsAServiceTwoTransformRequest::class, 'call'];
    $u->transform_response = [NoAsAServiceTwoTransformResponse::class, 'call'];
});

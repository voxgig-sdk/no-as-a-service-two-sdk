<?php
declare(strict_types=1);

// NoAsAServiceTwo SDK utility: result_headers

class NoAsAServiceTwoResultHeaders
{
    public static function call(NoAsAServiceTwoContext $ctx): ?NoAsAServiceTwoResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result) {
            if ($response && is_array($response->headers)) {
                $result->headers = $response->headers;
            } else {
                $result->headers = [];
            }
        }
        return $result;
    }
}

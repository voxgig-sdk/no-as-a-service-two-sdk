<?php
declare(strict_types=1);

// NoAsAServiceTwo SDK utility: result_body

class NoAsAServiceTwoResultBody
{
    public static function call(NoAsAServiceTwoContext $ctx): ?NoAsAServiceTwoResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result && $response && $response->json_func && $response->body) {
            $result->body = ($response->json_func)();
        }
        return $result;
    }
}

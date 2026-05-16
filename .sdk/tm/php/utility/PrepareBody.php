<?php
declare(strict_types=1);

// NoAsAServiceTwo SDK utility: prepare_body

class NoAsAServiceTwoPrepareBody
{
    public static function call(NoAsAServiceTwoContext $ctx): mixed
    {
        if ($ctx->op->input === 'data') {
            return ($ctx->utility->transform_request)($ctx);
        }
        return null;
    }
}

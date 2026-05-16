<?php
declare(strict_types=1);

// NoAsAServiceTwo SDK utility: feature_add

class NoAsAServiceTwoFeatureAdd
{
    public static function call(NoAsAServiceTwoContext $ctx, mixed $f): void
    {
        $ctx->client->features[] = $f;
    }
}

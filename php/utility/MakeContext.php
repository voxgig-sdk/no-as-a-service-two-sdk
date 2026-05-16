<?php
declare(strict_types=1);

// NoAsAServiceTwo SDK utility: make_context

require_once __DIR__ . '/../core/Context.php';

class NoAsAServiceTwoMakeContext
{
    public static function call(array $ctxmap, ?NoAsAServiceTwoContext $basectx): NoAsAServiceTwoContext
    {
        return new NoAsAServiceTwoContext($ctxmap, $basectx);
    }
}

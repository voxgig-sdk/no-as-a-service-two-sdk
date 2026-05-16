<?php
declare(strict_types=1);

// NoAsAServiceTwo SDK feature factory

require_once __DIR__ . '/feature/BaseFeature.php';
require_once __DIR__ . '/feature/TestFeature.php';


class NoAsAServiceTwoFeatures
{
    public static function make_feature(string $name)
    {
        switch ($name) {
            case "base":
                return new NoAsAServiceTwoBaseFeature();
            case "test":
                return new NoAsAServiceTwoTestFeature();
            default:
                return new NoAsAServiceTwoBaseFeature();
        }
    }
}

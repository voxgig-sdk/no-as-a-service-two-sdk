<?php
declare(strict_types=1);

// NoAsAServiceTwo SDK exists test

require_once __DIR__ . '/../noasaservicetwo_sdk.php';

use PHPUnit\Framework\TestCase;

class ExistsTest extends TestCase
{
    public function test_create_test_sdk(): void
    {
        $testsdk = NoAsAServiceTwoSDK::test(null, null);
        $this->assertNotNull($testsdk);
    }
}

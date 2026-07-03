<?php
declare(strict_types=1);

// NoAsAServiceTwo SDK configuration

class NoAsAServiceTwoConfig
{
    public static function make_config(): array
    {
        return [
            "main" => [
                "name" => "NoAsAServiceTwo",
            ],
            "feature" => [
                "test" => [
          'options' => [
            'active' => false,
          ],
        ],
            ],
            "options" => [
                "base" => "https://naas.isalman.dev",
                "auth" => [
                    "prefix" => "Bearer",
                ],
                "headers" => [
          'content-type' => 'application/json',
        ],
                "entity" => [
                    "rejection_reason" => [],
                ],
            ],
            "entity" => [
        'rejection_reason' => [
          'fields' => [
            [
              'active' => true,
              'name' => 'reason',
              'req' => true,
              'type' => '`$STRING`',
              'index$' => 0,
            ],
          ],
          'name' => 'rejection_reason',
          'op' => [
            'load' => [
              'input' => 'data',
              'name' => 'load',
              'points' => [
                [
                  'active' => true,
                  'args' => [],
                  'method' => 'GET',
                  'orig' => '/no',
                  'parts' => [
                    'no',
                  ],
                  'select' => [],
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body`',
                  ],
                  'index$' => 0,
                ],
              ],
              'key$' => 'load',
            ],
          ],
          'relations' => [
            'ancestors' => [],
          ],
        ],
      ],
        ];
    }


    public static function make_feature(string $name)
    {
        require_once __DIR__ . '/features.php';
        return NoAsAServiceTwoFeatures::make_feature($name);
    }
}

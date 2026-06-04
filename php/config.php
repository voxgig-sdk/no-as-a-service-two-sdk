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
              'name' => 'reason',
              'req' => true,
              'type' => '`$STRING`',
              'active' => true,
              'index$' => 0,
            ],
          ],
          'name' => 'rejection_reason',
          'op' => [
            'load' => [
              'name' => 'load',
              'points' => [
                [
                  'method' => 'GET',
                  'orig' => '/no',
                  'parts' => [
                    'no',
                  ],
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body`',
                  ],
                  'active' => true,
                  'args' => [],
                  'select' => [],
                  'index$' => 0,
                ],
              ],
              'input' => 'data',
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

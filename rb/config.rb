# NoAsAServiceTwo SDK configuration

module NoAsAServiceTwoConfig
  def self.make_config
    {
      "main" => {
        "name" => "NoAsAServiceTwo",
      },
      "feature" => {
        "test" => {
          "options" => {
            "active" => false,
          },
        },
      },
      "options" => {
        "base" => "https://naas.isalman.dev",
        "headers" => {
          "content-type" => "application/json",
        },
        "entity" => {
          "rejection_reason" => {},
        },
      },
      "entity" => {
        "rejection_reason" => {
          "fields" => [
            {
              "name" => "reason",
              "req" => true,
              "type" => "`$STRING`",
              "active" => true,
              "index$" => 0,
            },
          ],
          "name" => "rejection_reason",
          "op" => {
            "load" => {
              "name" => "load",
              "points" => [
                {
                  "method" => "GET",
                  "orig" => "/no",
                  "parts" => [
                    "no",
                  ],
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "active" => true,
                  "args" => {},
                  "select" => {},
                  "index$" => 0,
                },
              ],
              "input" => "data",
              "key$" => "load",
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
      },
    }
  end


  def self.make_feature(name)
    require_relative 'features'
    NoAsAServiceTwoFeatures.make_feature(name)
  end
end

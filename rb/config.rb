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
              "active" => true,
              "name" => "reason",
              "req" => true,
              "type" => "`$STRING`",
              "index$" => 0,
            },
          ],
          "name" => "rejection_reason",
          "op" => {
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "active" => true,
                  "args" => {},
                  "method" => "GET",
                  "orig" => "/no",
                  "parts" => [
                    "no",
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "index$" => 0,
                },
              ],
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

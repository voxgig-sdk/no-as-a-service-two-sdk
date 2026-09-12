# NoAsAServiceTwo SDK configuration

module NoAsAServiceTwoConfig
  # Return the process-wide config, built once on first use. The SDK reads
  # the config on every request and never writes to it, so one instance is
  # shared by every client rather than rebuilt per client.
  #
  # The returned hash is shared: treat it as read-only. Callers that need to
  # mutate should use make_config, which always returns a fresh copy.
  def self.shared_config
    @shared_config ||= make_config
  end


  # Build a fresh, fully materialised config hash. Every call rebuilds the
  # whole structure, so prefer shared_config unless you need a private copy
  # you intend to mutate.
  def self.make_config
    {
      "main" => {
        "name" => "NoAsAServiceTwo",
        "slug" => "no-as-a-service-two",
        "version" => "0.0.1",
        "target" => "rb",
      },
      "feature" => {
        "test" => {
          "options" => {
            "active" => false,
          },
          "transport" => "base",
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
              "short" => "A random rejection or \"no\" reason",
              "type" => "`$STRING`",
            },
          ],
          "name" => "rejection_reason",
          "op" => {
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/no",
                  "segments" => [
                    {
                      "lit" => "no",
                    },
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "no",
                  ],
                },
              ],
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

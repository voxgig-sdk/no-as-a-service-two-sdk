-- NoAsAServiceTwo SDK configuration

-- Build a fresh, fully materialised config table. Every call rebuilds the
-- whole structure, so prefer require("config_shared") unless you need a
-- private copy you intend to mutate.
local function make_config()
  return {
    main = {
      name = "NoAsAServiceTwo",
      slug = "no-as-a-service-two",
      version = "0.0.1",
      target = "lua",
    },
    feature = {
      ["test"] = {
        ["options"] = {
          ["active"] = false,
        },
        ["transport"] = "base",
      },
    },
    options = {
      base = "https://naas.isalman.dev",
      headers = {
        ["content-type"] = "application/json",
      },
      entity = {
        ["rejection_reason"] = {},
      },
    },
    entity = {
      ["rejection_reason"] = {
        ["fields"] = {
          {
            ["name"] = "reason",
            ["req"] = true,
            ["short"] = "A random rejection or \"no\" reason",
            ["type"] = "`$STRING`",
          },
        },
        ["name"] = "rejection_reason",
        ["op"] = {
          ["load"] = {
            ["input"] = "data",
            ["name"] = "load",
            ["points"] = {
              {
                ["args"] = {},
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/no",
                ["parts"] = {
                  "no",
                },
                ["select"] = {},
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
              },
            },
          },
        },
        ["relations"] = {
          ["ancestors"] = {},
        },
      },
    },
  }
end


local function make_feature(name)
  local features = require("features")
  local factory = features[name]
  if factory ~= nil then
    return factory()
  end
  return features.base()
end


-- Attach make_feature to the SDK class
local function setup_sdk(SDK)
  SDK._make_feature = make_feature
end


return make_config

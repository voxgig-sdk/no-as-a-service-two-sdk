package = "voxgig-sdk-no-as-a-service-two"
version = "0.0.1-1"
source = {
  -- git+https (GitHub dropped git:// in 2022); pin the install to the release
  -- tag pushed by `make publish`, and point at the lua/ subdir of the monorepo.
  url = "git+https://github.com/voxgig-sdk/no-as-a-service-two-sdk.git",
  tag = "lua/v0.0.1",
  dir = "no-as-a-service-two-sdk/lua"
}
description = {
  summary = "Unofficial generated Lua SDK for the No-as-a-Service public API. Not affiliated with or endorsed by the upstream API provider.",
  homepage = "https://github.com/voxgig-sdk/no-as-a-service-two-sdk",
  issues_url = "https://github.com/voxgig-sdk/no-as-a-service-two-sdk/issues",
  license = "MIT",
  labels = { "voxgig", "sdk", "generated-sdk", "openapi", "api-client", "no-as-a-service-two" }
}
dependencies = {
  "lua >= 5.3",
  "dkjson >= 2.5",
}
build = {
  type = "builtin",
  modules = {
    ["no-as-a-service-two_sdk"] = "no-as-a-service-two_sdk.lua",
    ["config"] = "config.lua",
    ["features"] = "features.lua",
  }
}

package = "voxgig-sdk-no-as-a-service-two"
version = "0.0-1"
source = {
  url = "git://github.com/voxgig-sdk/no-as-a-service-two-sdk.git"
}
description = {
  summary = "NoAsAServiceTwo SDK for Lua",
  license = "MIT"
}
dependencies = {
  "lua >= 5.3",
  "dkjson >= 2.5",
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

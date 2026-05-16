-- ProjectName SDK exists test

local sdk = require("no-as-a-service-two_sdk")

describe("NoAsAServiceTwoSDK", function()
  it("should create test SDK", function()
    local testsdk = sdk.test(nil, nil)
    assert.is_not_nil(testsdk)
  end)
end)

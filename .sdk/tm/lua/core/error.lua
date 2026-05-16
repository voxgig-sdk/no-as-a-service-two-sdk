-- NoAsAServiceTwo SDK error

local NoAsAServiceTwoError = {}
NoAsAServiceTwoError.__index = NoAsAServiceTwoError


function NoAsAServiceTwoError.new(code, msg, ctx)
  local self = setmetatable({}, NoAsAServiceTwoError)
  self.is_sdk_error = true
  self.sdk = "NoAsAServiceTwo"
  self.code = code or ""
  self.msg = msg or ""
  self.ctx = ctx
  self.result = nil
  self.spec = nil
  return self
end


function NoAsAServiceTwoError:error()
  return self.msg
end


function NoAsAServiceTwoError:__tostring()
  return self.msg
end


return NoAsAServiceTwoError

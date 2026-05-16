# NoAsAServiceTwo SDK utility: make_context
require_relative '../core/context'
module NoAsAServiceTwoUtilities
  MakeContext = ->(ctxmap, basectx) {
    NoAsAServiceTwoContext.new(ctxmap, basectx)
  }
end

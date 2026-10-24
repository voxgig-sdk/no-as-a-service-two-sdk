# NoAsAServiceTwo SDK utility: prepare_body
require_relative 'media'
module NoAsAServiceTwoUtilities
  PrepareBody = ->(ctx) {
    return nil unless ctx.op.input == "data"
    return NoAsAServiceTwoUtilities.raw_body(ctx.reqdata) if NoAsAServiceTwoUtilities.raw_request?(ctx.point)
    ctx.utility.transform_request.call(ctx)
  }
end

# NoAsAServiceTwo SDK feature factory

require_relative 'feature/base_feature'
require_relative 'feature/ratelimit_feature'
require_relative 'feature/retry_feature'
require_relative 'feature/test_feature'
require_relative 'feature/timeout_feature'


module NoAsAServiceTwoFeatures
  def self.make_feature(name)
    case name
    when "base"
      NoAsAServiceTwoBaseFeature.new
    when "ratelimit"
      NoAsAServiceTwoRatelimitFeature.new
    when "retry"
      NoAsAServiceTwoRetryFeature.new
    when "test"
      NoAsAServiceTwoTestFeature.new
    when "timeout"
      NoAsAServiceTwoTimeoutFeature.new
    else
      NoAsAServiceTwoBaseFeature.new
    end
  end
end

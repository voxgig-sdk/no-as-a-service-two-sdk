# NoAsAServiceTwo SDK feature factory

require_relative 'feature/base_feature'
require_relative 'feature/test_feature'


module NoAsAServiceTwoFeatures
  def self.make_feature(name)
    case name
    when "base"
      NoAsAServiceTwoBaseFeature.new
    when "test"
      NoAsAServiceTwoTestFeature.new
    else
      NoAsAServiceTwoBaseFeature.new
    end
  end
end

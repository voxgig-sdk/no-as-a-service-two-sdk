# NoAsAServiceTwo SDK utility: feature_add
module NoAsAServiceTwoUtilities
  FeatureAdd = ->(ctx, f) {
    ctx.client.features << f
  }
end

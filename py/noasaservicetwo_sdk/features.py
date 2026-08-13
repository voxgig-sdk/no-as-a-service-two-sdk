# NoAsAServiceTwo SDK feature factory

from noasaservicetwo_sdk.feature.base_feature import NoAsAServiceTwoBaseFeature
from noasaservicetwo_sdk.feature.test_feature import NoAsAServiceTwoTestFeature


def _make_feature(name):
    features = {
        "base": lambda: NoAsAServiceTwoBaseFeature(),
        "test": lambda: NoAsAServiceTwoTestFeature(),
    }
    factory = features.get(name)
    if factory is not None:
        return factory()
    return features["base"]()

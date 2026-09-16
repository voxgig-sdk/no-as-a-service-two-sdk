# NoAsAServiceTwo SDK feature factory

from noasaservicetwo_sdk.feature.base_feature import NoAsAServiceTwoBaseFeature
from noasaservicetwo_sdk.feature.ratelimit_feature import NoAsAServiceTwoRatelimitFeature
from noasaservicetwo_sdk.feature.retry_feature import NoAsAServiceTwoRetryFeature
from noasaservicetwo_sdk.feature.test_feature import NoAsAServiceTwoTestFeature
from noasaservicetwo_sdk.feature.timeout_feature import NoAsAServiceTwoTimeoutFeature


_FEATURES = {
    "base": lambda: NoAsAServiceTwoBaseFeature(),
    "ratelimit": lambda: NoAsAServiceTwoRatelimitFeature(),
    "retry": lambda: NoAsAServiceTwoRetryFeature(),
    "test": lambda: NoAsAServiceTwoTestFeature(),
    "timeout": lambda: NoAsAServiceTwoTimeoutFeature(),
}


def _make_feature(name):
    factory = _FEATURES.get(name)
    if factory is not None:
        return factory()
    return _FEATURES["base"]()


# True when this SDK was generated with the named feature class - the
# constructor's tolerance for extend-carried features reads this (an
# active name with no generated class must not become a BaseFeature
# stray when an extend instance carries it).
def _has_feature(name):
    return name in _FEATURES

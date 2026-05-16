# ProjectName SDK exists test

import pytest
from noasaservicetwo_sdk import NoAsAServiceTwoSDK


class TestExists:

    def test_should_create_test_sdk(self):
        testsdk = NoAsAServiceTwoSDK.test(None, None)
        assert testsdk is not None

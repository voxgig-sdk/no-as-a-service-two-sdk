# NoAsAServiceTwo SDK utility: make_context

from noasaservicetwo_sdk.core.context import NoAsAServiceTwoContext


def make_context_util(ctxmap, basectx):
    return NoAsAServiceTwoContext(ctxmap, basectx)

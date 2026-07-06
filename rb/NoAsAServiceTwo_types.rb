# frozen_string_literal: true

# Typed models for the NoAsAServiceTwo SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Member types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Ruby types are unenforced; these YARD
# annotations document the shapes. Do not edit by hand.

# RejectionReason entity data model.
#
# @!attribute [rw] reason
#   @return [String]
RejectionReason = Struct.new(
  :reason,
  keyword_init: true
)

# Request payload for RejectionReason#load.
#
# @!attribute [rw] reason
#   @return [String, nil]
RejectionReasonLoadMatch = Struct.new(
  :reason,
  keyword_init: true
)




import Path from 'node:path'
import * as Fs from 'node:fs'

import { test, describe, afterEach } from 'node:test'
import assert from 'node:assert'
import { createLiveTransport } from '../../live-runner'
import { runLiveEntity } from '../../live-entity'


import { NoAsAServiceTwoSDK, BaseFeature, stdutil } from '../../..'

import {
  envOverride,
  liveClientOptions,
  liveDelay,
  loadEnvLocal,
  makeCtrl,
  makeMatch,
  makeReqdata,
  makeStepData,
  makeValid,
  maybeSkipControl,
} from '../../utility'


// AFTER the imports on purpose: TypeScript hoists `import` above any
// statement in the emitted CommonJS, so a loader placed above them would
// run only after every imported module had already been evaluated - and
// anything reading process.env at module scope would miss these values.
loadEnvLocal(__dirname + '/../../../.env.local')


describe('RejectionReasonEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when NO_AS_A_SERVICE_TWO_TEST_LIVE=TRUE.
  afterEach(liveDelay('NO_AS_A_SERVICE_TWO_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = NoAsAServiceTwoSDK.test()
    const ent = testsdk.RejectionReason()
    assert(null != ent)
  })


  test('basic', async (t) => {

    const live = 'TRUE' === process.env.NO_AS_A_SERVICE_TWO_TEST_LIVE
    for (const op of ['load']) {
      if (!live && maybeSkipControl(t, 'entityOp', 'rejection_reason.' + op, live)) return
    }

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":[{"active":true,"name":"reason","req":true,"short":"A random rejection or \"no\" reason","type":"`$STRING`","index$":0}],"name":"rejection_reason","op":{"load":{"input":"data","name":"load","points":[{"active":true,"args":{},"contract":{"id":"GET /no","json":"{\"operationId\":\"getRandomNo\",\"parameters\":[],\"protocol\":\"http\",\"responses\":{\"200\":{\"content\":{\"application/json\":{\"examples\":{\"example1\":{\"summary\":\"Example rejection reason\",\"value\":{\"reason\":\"This feels like something Future Me would yell at Present Me for agreeing to.\"}},\"example2\":{\"summary\":\"Another example\",\"value\":{\"reason\":\"I'd rather watch paint dry while explaining the plot of Inception to my houseplant.\"}}},\"schema\":{\"properties\":{\"reason\":{\"description\":\"A random rejection or \\\"no\\\" reason\",\"example\":\"This feels like something Future Me would yell at Present Me for agreeing to.\",\"type\":\"string\"}},\"required\":[\"reason\"],\"type\":\"object\"}}},\"description\":\"A successful response containing a random rejection reason\"},\"429\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"error\":{\"example\":\"Too many requests, please try again later\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Rate limit exceeded. Maximum 120 requests per minute per IP\"},\"500\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"error\":{\"example\":\"An error occurred while processing your request\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Internal server error\"}},\"securitySource\":\"unspecified\"}","source":"openapi3","version":1},"kind":"http","method":"GET","orig":"/no","segments":[{"lit":"no"}],"select":{},"transform":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"load"}},"relations":{"ancestors":[]},"key$":"rejection_reason","name__orig":"rejection_reason","Name":"RejectionReason","name_":"rejection_reason","name-":"rejection-reason","NAME":"REJECTION_REASON","index$":0}, {"active":true,"entity":"rejection_reason","key$":"BasicRejectionReasonFlow","kind":"basic","name":"BasicRejectionReasonFlow","param":{},"step":[{"active":true,"data":{},"input":{"ref":"rejection_reason_ref01","srcdatavar":"rejection_reason_ref01_data","suffix":"_dt0"},"match":{},"op":"load","spec":[],"valid":[{"apply":"TextFieldMark","def":{"mark":"Mark01-rejection_reason_ref01"}}],"index$":0}]}, 'RejectionReason')
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select

    let rejection_reason_ref01_data = Object.values(setup.data.existing.rejection_reason)[0] as any

    // LOAD
    const rejection_reason_ref01_ent = client.RejectionReason()
    const rejection_reason_ref01_match_dt0: any = {}
    const rejection_reason_ref01_data_dt0 = (await rejection_reason_ref01_ent.load(rejection_reason_ref01_match_dt0)).data()
    assert(null != rejection_reason_ref01_data_dt0)


  })
})



function basicSetup(extra?: any) {
  // TODO: fix test def options
  const options: any = {} // null

  // TODO: needs test utility to resolve path
  const entityDataFile =
    Path.resolve(__dirname, 
      '../../../../.sdk/test/entity/rejection_reason/RejectionReasonTestData.json')

  // TODO: file ready util needed?
  const entityDataSource = Fs.readFileSync(entityDataFile).toString('utf8')

  // TODO: need a xlang JSON parse utility in voxgig/struct with better error msgs
  const entityData = JSON.parse(entityDataSource)

  options.entity = entityData.existing

  let client = NoAsAServiceTwoSDK.test(options, extra)
  const struct = client.utility().struct
  const merge = struct.merge
  const transform = struct.transform

  let idmap = transform(
    ['rejection_reason01','rejection_reason02','rejection_reason03'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  const env = envOverride({
    'NO_AS_A_SERVICE_TWO_TEST_REJECTION_REASON_ENTID': idmap,
    'NO_AS_A_SERVICE_TWO_TEST_LIVE': 'FALSE',
    'NO_AS_A_SERVICE_TWO_TEST_EXPLAIN': 'FALSE',
  })

  idmap = env['NO_AS_A_SERVICE_TWO_TEST_REJECTION_REASON_ENTID']

  const live = 'TRUE' === env.NO_AS_A_SERVICE_TWO_TEST_LIVE

  const transport = createLiveTransport()
  if (live) {
    const rawIds = process.env['NO_AS_A_SERVICE_TWO_TEST_REJECTION_REASON_ENTID']
    idmap = rawIds && rawIds.trim() ? JSON.parse(rawIds) : {}
    if (!idmap || Array.isArray(idmap) || typeof idmap !== 'object') {
      throw new Error('Live ENTID must be a JSON object')
    }
    client = new NoAsAServiceTwoSDK(merge([
      // FIRST, so the generated fields below win: sdk-test-control.json's
      // test.client.options adds to the live client, it does not redirect it.
      liveClientOptions(),
      {
      },
      // 'extra || {}', not a bare 'extra': struct.merge returns UNDEFINED when the
      // last entry is undefined, and basicSetup is normally called with no
      // argument at all - so a bare 'extra' silently discarded the apikey
      // and server values above and handed the SDK undefined. Harmless
      // while there was nothing in that object; not harmless now.
      extra || {},
      { system: { fetch: transport.fetch } }
    ]))
  }

  const setup = {
    idmap,
    env,
    options,
    client,
    struct,
    data: entityData,
    explain: 'TRUE' === env.NO_AS_A_SERVICE_TWO_TEST_EXPLAIN,
    live,
    transport,
    now: Date.now(),
  }

  return setup
}
  

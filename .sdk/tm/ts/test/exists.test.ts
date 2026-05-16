
import { test, describe } from 'node:test'
import { equal } from 'node:assert'


import { NoAsAServiceTwoSDK } from '..'


describe('exists', async () => {

  test('test-mode', async () => {
    const testsdk = await NoAsAServiceTwoSDK.test()
    equal(null !== testsdk, true)
  })

})

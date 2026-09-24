
import { test, describe } from 'node:test'
import { equal } from 'node:assert'


import { NoAsAServiceTwoSDK } from '..'


describe('exists', async () => {

  test('test-mode', () => {
    const testsdk = NoAsAServiceTwoSDK.test()
    equal(testsdk instanceof NoAsAServiceTwoSDK, true,
      'NoAsAServiceTwoSDK.test() must return a client synchronously')
  })

})

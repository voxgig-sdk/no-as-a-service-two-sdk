
import { Context } from './Context'


class NoAsAServiceTwoError extends Error {

  isNoAsAServiceTwoError = true

  sdk = 'NoAsAServiceTwo'

  code: string
  ctx: Context

  constructor(code: string, msg: string, ctx: Context) {
    super(msg)
    this.code = code
    this.ctx = ctx
  }

}

export {
  NoAsAServiceTwoError
}


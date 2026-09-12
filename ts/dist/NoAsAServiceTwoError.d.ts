import { Context } from './Context';
declare class NoAsAServiceTwoError extends Error {
    isNoAsAServiceTwoError: boolean;
    sdk: string;
    code: string;
    ctx: Context;
    status: number;
    get notFound(): boolean;
    constructor(code: string, msg: string, ctx: Context);
}
export { NoAsAServiceTwoError };

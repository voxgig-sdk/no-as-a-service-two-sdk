"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.NoAsAServiceTwoError = void 0;
class NoAsAServiceTwoError extends Error {
    isNoAsAServiceTwoError = true;
    sdk = 'NoAsAServiceTwo';
    code;
    ctx;
    status = -1;
    // `err.notFound` rather than a magic number at every call site.
    get notFound() { return 404 === this.status; }
    constructor(code, msg, ctx) {
        super(msg);
        this.code = code;
        this.ctx = ctx;
    }
}
exports.NoAsAServiceTwoError = NoAsAServiceTwoError;
//# sourceMappingURL=NoAsAServiceTwoError.js.map
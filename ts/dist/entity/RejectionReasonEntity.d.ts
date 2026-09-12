import { NoAsAServiceTwoEntityBase } from '../NoAsAServiceTwoEntityBase';
import type { NoAsAServiceTwoSDK } from '../NoAsAServiceTwoSDK';
import type { Control } from '../types';
import type { RejectionReason, RejectionReasonLoadMatch } from '../NoAsAServiceTwoTypes';
declare class RejectionReasonEntity extends NoAsAServiceTwoEntityBase<RejectionReason> {
    constructor(client: NoAsAServiceTwoSDK, entopts: any);
    make(this: RejectionReasonEntity): RejectionReasonEntity;
    load(this: any, reqmatch?: RejectionReasonLoadMatch, ctrl?: Control): Promise<RejectionReasonEntity>;
}
export { RejectionReasonEntity };

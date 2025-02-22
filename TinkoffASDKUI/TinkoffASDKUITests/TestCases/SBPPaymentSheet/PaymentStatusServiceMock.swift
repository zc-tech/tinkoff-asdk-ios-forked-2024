//
//  PaymentStatusServiceMock.swift
//  TinkoffASDKUI-Unit-Tests
//
//  Created by Aleksandr Pravosudov on 28.04.2023.
//

import TinkoffASDKCore
@testable import TinkoffASDKUI

final class PaymentStatusServiceMock: IPaymentStatusService {

    // MARK: - getPaymentState

    typealias GetPaymentStateArguments = (paymentId: String, completion: PaymentStatusServiceCompletion)

    var getPaymentStateCallsCount = 0
    var getPaymentStateReceivedArguments: GetPaymentStateArguments?
    var getPaymentStateReceivedInvocations: [GetPaymentStateArguments] = []
    var getPaymentStateCompletionClosureInputs: [Result<GetPaymentStatePayload, Error>]?
    var lastPaymentStateCompletionClosureInputIndex = 0

    func getPaymentState(paymentId: String, completion: @escaping PaymentStatusServiceCompletion) {
        getPaymentStateCallsCount += 1
        let arguments = (paymentId, completion)
        getPaymentStateReceivedArguments = arguments
        getPaymentStateReceivedInvocations.append(arguments)
        if let inputs = getPaymentStateCompletionClosureInputs,
           let result = inputs[safe: lastPaymentStateCompletionClosureInputIndex] {
            lastPaymentStateCompletionClosureInputIndex += 1
            completion(result)
        }
    }
}

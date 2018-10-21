//
//  IntentHandler.swift
//  sirikitTest1 Intents
//
//  Created by hyunsu han on 21/10/2018.
//  Copyright © 2018 hyunsoo. All rights reserved.
//

import Intents

class IntentHandler: INExtension {}

extension IntentHandler: INSendPaymentIntentHandling {
    func handle(intent: INSendPaymentIntent, completion: @escaping (INSendPaymentIntentResponse) -> Void) {
        guard let amount = intent.currencyAmount?.amount?.intValue else {
            completion(INSendPaymentIntentResponse(code: .failure, userActivity: nil))
            return
        }
        BankAccount.withdraw(amount: amount)
        completion(INSendPaymentIntentResponse(code: .success, userActivity: nil))
    }
    
}

extension IntentHandler: INRequestPaymentIntentHandling {
    func handle(intent: INRequestPaymentIntent, completion: @escaping (INRequestPaymentIntentResponse) -> Void) {
        guard let amount = intent.currencyAmount?.amount?.intValue else {
            completion(INRequestPaymentIntentResponse(code: .failure, userActivity: nil))
            return
        }
        BankAccount.deposit(amount: amount)
        completion(INRequestPaymentIntentResponse(code: .success, userActivity: nil))
    }
}

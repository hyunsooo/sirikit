//
//  BankAccount.swift
//  sirikitTest1
//
//  Created by hyunsu han on 21/10/2018.
//  Copyright © 2018 hyunsoo. All rights reserved.
//

import Foundation

class BankAccount {
    
    private init() {}
    static let bankAccountKey = "Bank Account"
    static let suiteName = "group.han.hyunsoo.sirikitTest1"
    
    static func setBalance(toAmount amount: Int) {
        guard let defaults = UserDefaults(suiteName: suiteName) else { return }
        print("set amount : \(amount)")
        defaults.set(amount, forKey: bankAccountKey)
        defaults.synchronize()
    }
    
    static func checkBalance() -> Int? {
        guard let defaults = UserDefaults(suiteName: suiteName) else { return nil }
        defaults.synchronize()
        let balance = defaults.integer(forKey: bankAccountKey)
        print(balance)
        return balance
    }
    
    @discardableResult
    static func withdraw(amount: Int) -> Int? {
        guard let defaults = UserDefaults(suiteName: suiteName) else { return nil }
        let balance = defaults.integer(forKey: bankAccountKey)
        let newBalance = balance - amount
        setBalance(toAmount: newBalance)
        return newBalance
    }
    
    @discardableResult
    static func deposit(amount: Int) -> Int? {
        guard let defaults = UserDefaults(suiteName: suiteName) else { return nil }
        let balance = defaults.integer(forKey: bankAccountKey)
        let newBalance = balance + amount
        setBalance(toAmount: newBalance)
        return newBalance
    }
    
}

//
//  ViewController.swift
//  sirikitTest1
//
//  Created by hyunsu han on 21/10/2018.
//  Copyright © 2018 hyunsoo. All rights reserved.
//

import UIKit
import Intents

class ViewController: UIViewController {

    @IBOutlet weak var balanceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        INPreferences.requestSiriAuthorization { (status) in
            if status == INSiriAuthorizationStatus.authorized {
                print("authorized")
            } else {
                print("Shit")
            }
        }
        if let amount = BankAccount.checkBalance() {
            if amount == 0 { BankAccount.setBalance(toAmount: 1000)  }
            else { BankAccount.setBalance(toAmount: amount)  }
        }
    }
    
    
    @IBAction func checkBalance() {
//        guard let balance = BankAccount.checkBalance() else { return }
        print(BankAccount.checkBalance() ?? 0, "원 있네요.")
        balanceLabel.text = "잔액 : \(BankAccount.checkBalance() ?? 0) 원"
    }
}


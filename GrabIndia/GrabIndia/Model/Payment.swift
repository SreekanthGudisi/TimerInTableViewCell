//
//  Payment.swift
//  GrabIndia
//
//  Created by Gudisi, Sreekanth on 14/12/19.
//  Copyright © 2019 Gudisi, Sreekanth. All rights reserved.
//

import Foundation

@objc protocol PaymentDelagate : NSObjectProtocol {
    
    func updatePaymentTimestamp()
}


class Payment: NSObject {
    var index = 0
    var isGrabbed = false
    var maxCounter = 600 //10minuts
    var counter = 0
    var timer = Timer()
    var delegate : PaymentDelagate? = nil
    var dateInitiated : Date? = nil
    
    @objc func incrementCounter() {
        
        NSLog("payment index \(index)")
        
        guard isGrabbed == true else {
            return
        }
        
        guard counter <= maxCounter else {
            
            timer.invalidate()
            return
        }
        
        counter += 1
        
        guard delegate == nil else {
            delegate?.updatePaymentTimestamp()
            return
        }
    }
    
    func initiatePayment() {
        if timer.isValid {
            timer.invalidate()
        }
        
        isGrabbed = true
        dateInitiated = Date()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(Payment.incrementCounter), userInfo: nil, repeats: true)
    }
    
    func getTimestamp() -> String {
        let dateComponents = Calendar.current.dateComponents([.minute, .second], from: dateInitiated!, to: Date())
        if dateComponents.second! <= 9 {
            return "\(dateComponents.minute!):0\(dateComponents.second!)"
        }
        return "\(dateComponents.minute!):\(dateComponents.second!)"
    }
    
    static func defaultPayment(with index: Int) -> Payment {
        
        let payment = Payment()
        payment.index = index
        return payment
    }
}

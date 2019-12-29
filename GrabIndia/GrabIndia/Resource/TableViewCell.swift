//
//  TableViewCell.swift
//  GrabIndia
//
//  Created by Gudisi, Sreekanth on 14/12/19.
//  Copyright © 2019 Gudisi, Sreekanth. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell, PaymentDelagate {
    
    var payment = Payment()
    
    @IBOutlet weak var indexLabel: UILabel!
    @IBOutlet weak var gPaybutton: UIButton!
    @IBOutlet weak var proceesingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    @IBAction func proccessingButtonTapped(_ sender: UIButton) {
        if payment.isGrabbed == false {
            payment.initiatePayment()
        }
    }
    
    func setupCell() {
        self.indexLabel.text = payment.index.description
        self.proceesingLabel.text = "Processing : 0:00"
    }

    func updatePaymentTimestamp() {
        DispatchQueue.main.async {
            self.proceesingLabel.text = "Processing : " + self.payment.getTimestamp()
        }
    }
}

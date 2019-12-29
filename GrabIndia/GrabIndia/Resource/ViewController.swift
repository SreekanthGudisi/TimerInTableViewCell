//
//  ViewController.swift
//  GrabIndia
//
//  Created by Gudisi, Sreekanth on 14/12/19.
//  Copyright © 2019 Gudisi, Sreekanth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    
    var payments = [Payment]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupPayments()
    }
    
    private func setupPayments() {
        for i in 0...19 {
            payments.append(Payment.defaultPayment(with: i+1))
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 61.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return payments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell")! as? TableViewCell
        cell?.payment = payments[indexPath.row]
        cell?.setupCell()
        return cell!
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        payments[indexPath.row].delegate = cell as? TableViewCell
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        payments[indexPath.row].delegate = nil
    }
}


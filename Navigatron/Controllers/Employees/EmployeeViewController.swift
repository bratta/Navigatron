//
//  EmployeeViewController.swift
//  Navigatron
//
//  Created by Timothy Gourley on 3/27/19.
//  Copyright © 2019 Timothy Gourley. All rights reserved.
//

import UIKit

class EmployeeViewController: UIViewController {
    @IBOutlet weak var employeeLabel: UILabel!
    var selectedEmployee: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        employeeLabel.text = selectedEmployee ?? "Employee"
    }
}

//
//  EmployeesViewController.swift
//  Navigatron
//
//  Created by Timothy Gourley on 3/27/19.
//  Copyright © 2019 Timothy Gourley. All rights reserved.
//

import UIKit

class EmployeesViewController: UIViewController {
    var employee : String? {
        didSet {
            performSegue(withIdentifier: "GotoEmployee", sender: self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

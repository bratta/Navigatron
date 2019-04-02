//
//  ContactEditViewController.swift
//  Navigatron
//
//  Created by Timothy Gourley on 3/27/19.
//  Copyright © 2019 Timothy Gourley. All rights reserved.
//

import UIKit

class ContactEditViewController: UIViewController {
    @IBOutlet weak var contactLabel: UILabel!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var hireButton: UIButton!
    
    var selectedContact: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        contactLabel.text = "Editing \(selectedContact ?? "This Contact")"
        hireButton.setTitle("Hire \(selectedContact ?? "This Contact")!", for: .normal)
    }
}

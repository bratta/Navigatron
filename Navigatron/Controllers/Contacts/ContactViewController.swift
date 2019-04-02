//
//  ContactViewController.swift
//  Navigatron
//
//  Created by Timothy Gourley on 3/27/19.
//  Copyright © 2019 Timothy Gourley. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController {
    
    var selectedContact: String?
    @IBOutlet weak var contactLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let contact = selectedContact {
            contactLabel.text = contact
        }
    }
    @IBAction func editButtonPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "GoToEditContact", sender: self)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoToEditContact" {
            let contactEditViewController = segue.destination as! ContactEditViewController
            contactEditViewController.selectedContact = selectedContact
        }
    }
}

//
//  ContactsTableViewController.swift
//  Navigatron
//
//  Created by Timothy Gourley on 4/1/19.
//  Copyright © 2019 Timothy Gourley. All rights reserved.
//

import UIKit

class ContactsTableViewController: UITableViewController {

    private let contacts = ["David Charleston", "Jonathan Phaedrus", "Megan Tarash", "Missouri Williams", "Edmund Sense"]
    var selectedContact : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactsCell", for: indexPath)
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.text = contacts[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedContact = contacts[indexPath.row]
        performSegue(withIdentifier: "GoToContact", sender: self)
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoToContact" {
            let contactViewController = segue.destination as! ContactViewController
            contactViewController.selectedContact = selectedContact ?? "Unknown Contact"
        }
    }
    
    @IBAction func hireContact(segue: UIStoryboardSegue) {
        var employee: String = ""
        
        // Pull the contact information from the source controller
        if let contactEditViewController = segue.source as? ContactEditViewController {
            employee = contactEditViewController.selectedContact ?? ""
        }
        
        // The index of the tab that holds our EmployeesViewController
        // NOTE: Tabs are zero-indexed, so 0 = Contacts, 1 = Employees
        self.tabBarController?.selectedIndex = 1
        
        // Get a reference to the EmployeesNavigationController. It is the
        // 'selectedViewController' since the tab bar controller doesn't
        // know about each navigation controller's child view controllers.
        // It only knows about ContactsNavigationController and
        // EmployeesNavigationController
        if let employeesNavigationController = self.tabBarController?.selectedViewController as? UINavigationController {
            // Check whether the top-most view controller on the stack is an 'EmployeeViewController'
            // This will change in complexity if you have more complicated logic.
            if employeesNavigationController.topViewController is EmployeeViewController {
                employeesNavigationController.popViewController(animated: true)
            }
            
            // Get a safe reference to employeesTableViewController. This is technically
            // unnecessary since we know it will be available, because it was instantiated
            // and added to the stack when we set the tab bar controller's selected index
            // to 1, but it's good practice nonetheless.
            if let employeesTableViewController = employeesNavigationController.topViewController as? EmployeesTableViewController {
                employeesTableViewController.selectedEmployee = employee
            }
        }
    }
}

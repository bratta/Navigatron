//
//  EmployeesTableViewController.swift
//  Navigatron
//
//  Created by Timothy Gourley on 4/2/19.
//  Copyright © 2019 Timothy Gourley. All rights reserved.
//

import UIKit

class EmployeesTableViewController: UITableViewController {

    let employees = ["Jim Halpert", "Pam Beesly", "Kevin Malone", "Andy Bernard", "Dwight Schrute", "Angela Martin", "Erin Hannon"]

    var selectedEmployee: String? {
        didSet {
            performSegue(withIdentifier: "GoToEmployee", sender: self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmployeeCell", for: indexPath)

        cell.textLabel?.textColor = UIColor.black
        cell.textLabel?.text = employees[indexPath.row]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedEmployee = employees[indexPath.row]
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoToEmployee" {
            let employeeViewController = segue.destination as! EmployeeViewController
            employeeViewController.selectedEmployee = selectedEmployee ?? "Unknown Employee"
        }
    }
}

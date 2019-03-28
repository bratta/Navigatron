//
//  ContactEditViewController.swift
//  Navigatron
//
//  Created by Timothy Gourley on 3/27/19.
//  Copyright © 2019 Timothy Gourley. All rights reserved.
//

import UIKit

class ContactEditViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Only do this when the "Hire This Contact!" button is tapped
        if segue.identifier == "GotoHireContact" {
            guard let tabBarVC = tabBarController else { return }
            tabBarVC.selectedIndex = 1 // The index of our Employees tab
            let employeesNavBarVC = tabBarVC.selectedViewController as! UINavigationController

            // If we're not on the Employees List, let's navigate there.
            // This step might differ if you have complex navigation
            if let _ = employeesNavBarVC.topViewController as? EmployeeViewController {
                employeesNavBarVC.popViewController(animated: true)
            }
            
            // Now look through all the controllers on the navigation stack
            // and set some data. Here we are just using a string, but you could
            // pass back a model, an ID column, or whatever your application requires.
            employeesNavBarVC.viewControllers.forEach {
                if let employeesVC = $0 as? EmployeesViewController {
                    employeesVC.employee = "pass your employee object"
                }
            }
        }
    }
}

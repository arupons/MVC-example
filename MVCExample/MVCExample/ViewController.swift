//
//  ViewController.swift
//  MVCExample
//
//  Created by Peter Druska on 14/03/16.
//  Copyright © 2016 Bedots.eu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var tableView: UITableView!
    var userName: String!
    var email: String!
    var password: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func register(sender: AnyObject) {
        /*
            1) API request to create new user
            2) Read response
            3) If user is created on server, he is saved to persistent storage
        */
        let user = User(userName: userName, email: email, password: password)
        print(user.description)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("formCell", forIndexPath: indexPath) as! FormViewCell
        cell.formInput.delegate = self
        if indexPath.row == 0 {
            cell.formInput.tag = 0
            cell.formInput.placeholder = "Username"
        } else if indexPath.row == 1 {
            cell.formInput.tag = 1
            cell.formInput.placeholder = "Email"
            cell.formInput.keyboardType = UIKeyboardType.EmailAddress
        } else {
            cell.formInput.tag = 2
            cell.formInput.placeholder = "Password"
            cell.formInput.secureTextEntry = true
        }
        return cell
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField.tag == 0 {
            userName = textField.text
        } else if textField.tag == 1 {
            email = textField.text
        } else {
            password = textField.text
        }
        
        textField.resignFirstResponder()
        return true
    }

}


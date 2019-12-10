//
//  ViewController.swift
//  SimpleLogIn
//
//  Created by Rayan Ahmed on 12/9/19.
//  Copyright © 2019 Rayan Ahmed. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {

    @IBOutlet weak var tfpassword: UITextField!
    @IBOutlet weak var tfusername: UITextField!
    
    var user = PFUser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onSignUp(_ sender: Any) {
        let username = tfusername.text!
        let password = tfpassword.text!
        
        if (!isValidInput(text: username) || !isValidInput(text: password)) {
            displayErrorMessage()
        } else {
            
            user.username = username
            user.password = password
            
            user.signUpInBackground { (successful, error) in
                if successful {
                    self.signInUser()
                } else {
                    //print(error)
                }
            }
        }
    }
    @IBAction func onLogin(_ sender: Any) {
        let username = tfusername.text!
        let password = tfpassword.text!
        if (!isValidInput(text: username) || !isValidInput(text: password)) {
            displayErrorMessage()
        } else {
            PFUser.logInWithUsername(inBackground: username, password:password) {
              (user, error) -> Void in
              if user != nil {
                self.signInUser()
              } else {
                let controller = UIAlertController (title: "Incorrect username or password", message: "please sign up", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .cancel) { _ in
                    self.dismiss (animated: true, completion: nil)
                }
                controller.addAction (okAction)
                self.present(controller, animated:true)
              }
            }
             
        }
    }
    
    func displayErrorMessage () {
        let controller = UIAlertController (title: "Invalid inputs", message: "please provide valid inputs", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel) { _ in
            self.dismiss (animated: true, completion: nil)
        }
        controller.addAction (okAction)
        present(controller, animated:true)
    }
    
    func isValidInput (text: String) -> Bool {
        if (text.isEmpty || text.count < 4) {
            return false;
        } else {
            return true;
        }
    }
    
    func signInUser () -> Void {
        let viewController = storyboard?.instantiateViewController(identifier: "HomePageViewController") as! HomePageViewController
        if let navigator = navigationController {
                navigator.pushViewController(viewController, animated: true)
        }
    }
}


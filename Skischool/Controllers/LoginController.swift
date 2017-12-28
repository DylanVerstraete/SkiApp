//
//  LoginController.swift
//  SkischoolApp
//
//  Created by Nele Van Melckebeke on 26/12/17.
//  Copyright © 2017 Hogent. All rights reserved.
//

import UIKit

class LoginController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.view.backgroundColor
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Login(_ sender: Any) {
        //if emailField.text != "" && passwordField.text != "" {
            UserService.login(email: "erik@test.be", password: "test", succes: {
                self.performSegue(withIdentifier: "home", sender: self)
            }, failure:{ (response) -> Void in (print(response))})
        //}
    }
    
    @IBAction func unwindFromRegister(_ segue: UIStoryboardSegue) {
        switch (segue.identifier!) {
        case "didRegister":
            let registerController = segue.source as! RegisterController
            emailField.text = registerController.emailField.text!
            print("Did register")
        case "didNotRegister":
            print("Did not register")
        default:
            fatalError("Unknown segue")
        }
    }
    
    
}


//
//  RegisterController.swift
//  Skischool
//
//  Created by Nele Van Melckebeke on 26/12/17.
//  Copyright © 2017 Hogent. All rights reserved.
//

import UIKit

class RegisterController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func Register(_ sender: Any) {
        if emailField.text != "" && passwordField.text != "" {
            UserService.register(email: emailField.text!, password: passwordField.text!, succes: {
                self.performSegue(withIdentifier: "didRegister", sender: self)
            }, failure:{ (response) -> Void in (print(response))})
        }
    }
    
    @IBAction func GoBack(_ sender: Any) {
        self.performSegue(withIdentifier: "didNotRegister", sender: self)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
   

}

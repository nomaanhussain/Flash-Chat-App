//
//  RegisterViewController.swift
//  Flash Chat
//
//  This is the View Controller which registers new users with Firebase
//

import UIKit
import Firebase
import SVProgressHUD

class RegisterViewController: UIViewController {

    
    //Pre-linked IBOutlets

    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

  
    @IBAction func registerPressed(_ sender: AnyObject) {
<<<<<<< HEAD
=======
        

        
        //TODO: Set up a new user on our Firbase database
        
        

>>>>>>> 6b16244d910d3e6a0e435eb65ce95a2ba6bc8164
        
        SVProgressHUD.show()
        
        FIRAuth.auth()?.createUser(withEmail: emailTextfield.text!, password: passwordTextfield.text!, completion: { (user, error) in
            if error != nil {
                print(error!)
            }
            else {
                
                print ("Registration Successful!")
                
                self.performSegue(withIdentifier: "goToChat", sender: self)
            }
            
        })
    } 
    
    
}

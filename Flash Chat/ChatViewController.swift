//
//  ViewController.swift
//  Flash Chat
//
//  Created by Noman Hussain on 21/04/2018.
//  Copyright © 2018 Noman Hussain. All rights reserved.
//

import UIKit
import Firebase
import ChameleonFramework

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    // Declare instance variables here
    var messageArray : [Message] = [Message]()
    
    // We've pre-linked the IBOutlets
    @IBOutlet var heightConstraint: NSLayoutConstraint!
    @IBOutlet var sendButton: UIButton!
    @IBOutlet var messageTextfield: UITextField!
    @IBOutlet var messageTableView: UITableView!
    
    var topButton = UIButton()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
           messageTableView.delegate = self
        messageTableView.dataSource = self
        messageTableView.register(UINib(nibName: "MessageCell", bundle: nil) , forCellReuseIdentifier: "customMessageCell")
        messageTextfield.delegate = self
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tableViewTapped))
        messageTableView.addGestureRecognizer(tapGesture)
        configureTableView()
        retrieveMessages()
        
        messageTableView.separatorStyle = .none
   
    }


    
    //MARK: - TableView Methods
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customMessageCell", for: indexPath) as! CustomMessageCell
        
        cell.messageBody.text = messageArray[indexPath.row].messageBody
        cell.senderUsername.text = messageArray[indexPath.row].sender
        cell.avatarImageView.image = UIImage(named: "egg")
        
        //Set background as blue if message is from logged in user
        if cell.senderUsername.text == FIRAuth.auth()?.currentUser?.email as String! {
            cell.avatarImageView.backgroundColor = UIColor.flatMint()
            cell.messageBackground.backgroundColor = UIColor.flatSkyBlue()

<<<<<<< HEAD
        }
        //Set background as grey if message is from another user
        else {
            cell.avatarImageView.backgroundColor = UIColor.flatWatermelon()
            cell.messageBackground.backgroundColor = UIColor.flatGray()
        }
        
        return cell
    }
=======
        //TODO: Register your MessageCell.xib file here:

        
    }

    ///////////////////////////////////////////
    
    //MARK: - TableView DataSource Methods
    
    
    
    //TODO: Declare cellForRowAtIndexPath here:
    
    
    
    //TODO: Declare numberOfRowsInSection here:
    
    
    
    //TODO: Declare tableViewTapped here:
>>>>>>> 6b16244d910d3e6a0e435eb65ce95a2ba6bc8164
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageArray.count
    }
    
    @objc func tableViewTapped() {
        messageTextfield.endEditing(true)
    }

    
    //TODO: Declare configureTableView here:
    
<<<<<<< HEAD
    func configureTableView() {
        messageTableView.rowHeight = UITableViewAutomaticDimension
        messageTableView.estimatedRowHeight = 120.0
    }
=======
    
    
    ///////////////////////////////////////////
>>>>>>> 6b16244d910d3e6a0e435eb65ce95a2ba6bc8164
    
    //MARK:- TextField Delegate Methods
    
    

    //MARK: - TextField Delegate Methods
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {

        
        UIView.animate(withDuration: 0.5) { 
            self.heightConstraint.constant = 308
            self.view.layoutIfNeeded()
        }
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.5) {
            self.heightConstraint.constant = 50
            self.view.layoutIfNeeded()
        }
    }

    
    ///////////////////////////////////////////
    
    
    //MARK: - Send & Recieve from Firebase
    
<<<<<<< HEAD
=======
    
    
    
    
>>>>>>> 6b16244d910d3e6a0e435eb65ce95a2ba6bc8164
    @IBAction func sendPressed(_ sender: AnyObject) {
        
        messageTextfield.endEditing(true)
        messageTextfield.isEnabled = false
        sendButton.isEnabled = false
        
        let messagesDB = FIRDatabase.database().reference().child("Messages")
        
        let messageDictionary : NSDictionary = ["Sender" : FIRAuth.auth()?.currentUser!.email as String!, "MessageBody" : messageTextfield.text!]

        messagesDB.childByAutoId().setValue(messageDictionary) {
            (error, ref) in
            if error != nil {
                print(error!)
            }
            else {
                print("Message saved successfully!")
            }
            DispatchQueue.main.async {
                self.messageTextfield.isEnabled = true
                self.sendButton.isEnabled = true
                self.messageTextfield.text = ""
            }
            
  
        }
        
    }
    
    //TODO: Create the retrieveMessages method here:
    
<<<<<<< HEAD
    func retrieveMessages() {
        let messageDB = FIRDatabase.database().reference().child("Messages")
        
        messageDB.observe(.childAdded, with: { snapshot in
            
            let snapshotValue = snapshot.value as! NSDictionary
            let text = snapshotValue["MessageBody"] as! String
            let sender = snapshotValue["Sender"] as! String
            
            let message = Message()
            message.messageBody = text
            message.sender = sender
            
            self.messageArray.append(message)
            
            DispatchQueue.main.async {
                self.configureTableView()
                self.messageTableView.reloadData()
            }
        })
    }
    
    ////////////////////////////////////////////////
=======
    

>>>>>>> 6b16244d910d3e6a0e435eb65ce95a2ba6bc8164
    
    
    
    @IBAction func logOutPressed(_ sender: AnyObject) {
<<<<<<< HEAD
=======
        
        //TODO: Log out the user and send them back to WelcomeViewController
>>>>>>> 6b16244d910d3e6a0e435eb65ce95a2ba6bc8164
        
        do {
            try FIRAuth.auth()?.signOut()
        }
        catch {
            print(error)
            print("error: there was a problem logging out")
        }
        
        guard (navigationController?.popToRootViewController(animated: true)) != nil
            else {
                print("No View Controller to Pop")
                return
        }
    }
    


}

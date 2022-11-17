//
//  ChatViewController.swift
//  ChatApp
//
//  Created by Sévio on 07/11/22.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class ChatViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Chat"
        navigationItem.hidesBackButton = true
        
    }
    
    
    @IBAction func sendPressed(_ sender: UIButton) {
    }
    
    
    
    @IBAction func logOut(_ sender: UIBarButtonItem) {
        
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true) // Voltar a tela inicial
            
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
        
        
        
    }
    
}

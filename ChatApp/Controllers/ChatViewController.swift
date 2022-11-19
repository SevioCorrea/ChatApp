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
    
    var messages: [Message] = [
        Message(sender: "1@2.com", body: "Olá."),
        Message(sender: "1@b.com", body: "Oi"),
        Message(sender: "1@2.com", body: "Kkkkk."),
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
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

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath)
        cell.textLabel?.text = messages[indexPath.row].body
        return cell
    }
    
    
}

extension ChatViewController: UITableViewDelegate {
    
}

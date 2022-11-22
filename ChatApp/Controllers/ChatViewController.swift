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
    
    let db = Firestore.firestore()
    
    var messages: [Message] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        title = "Chat"
        navigationItem.hidesBackButton = true
        
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        
        // Showing messages
        loadMessages()
        
    }
    
    // Load messages
    func loadMessages() {
        

        db.collection(K.FStore.collectionName).addSnapshotListener { (querySnapshot, error) in
            self.messages = []
            if let e = error {
                print("There was an issue retrieving data from Firestore. \(e)")
            } else {
                if let snapshotDocuments = querySnapshot?.documents {
                    for doc in snapshotDocuments {
                        let data = doc.data()
                        if let messagesender = data[K.FStore.senderField] as? String, let messageBody = data[K.FStore.bodyField] as? String {
                            let newMessage = Message(sender: messagesender, body: messageBody)
                            self.messages.append(newMessage)
                            
                            
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                            }
                        }
                    }
                }
            }
        }
    }
    
    
    @IBAction func sendPressed(_ sender: UIButton) {
        
        // Acessando usuário que está logado
        if let messageBody = messageTextField.text, let messageSender = Auth.auth().currentUser?.email {
            db.collection(K.FStore.collectionName).addDocument(data: [K.FStore.senderField: messageSender, K.FStore.bodyField: messageBody]) { (error) in
                if let e = error {
                    print("There was an issue saving data to Firestore, \(e)")
                } else {
                    print("Successfully saved data.")
                }
            }
        }
    }
    
    
    // MARK - LogOut Button
    @IBAction func logOut(_ sender: UIBarButtonItem) {
        
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true) // Voltar a tela inicial
            
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
    
}

// MARK - Cell
extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! MessageCell
        cell.label.text = messages[indexPath.row].body
        return cell
    }
    
    
}

extension ChatViewController: UITableViewDelegate {
    
}

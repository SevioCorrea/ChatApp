//
//  LoginViewController.swift
//  ChatApp
//
//  Created by Sévio on 07/11/22.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth


class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var adviceLabel: UILabel!
    
    @IBAction func createAccount(_ sender: UIButton) {
        self.performSegue(withIdentifier: "DontHaveAccount", sender: self)
    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
        
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    self.adviceLabel.font = UIFont.preferredFont(forTextStyle: .body)
                    self.adviceLabel.text = e.localizedDescription
                    print(e.localizedDescription) // Localized para mostrar o erro no Idioma do Dispositivo
                } else {
                    // If not get error
                    // Navigate to the ChatViewController
                    self.performSegue(withIdentifier: K.loginSegue, sender: self)
                }
            }
        }
    }
}

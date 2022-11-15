//
//  WelcomeViewController.swift
//  ChatApp
//
//  Created by Sévio on 07/11/22.
//

import UIKit
import CLTypingLabel

class WelcomeViewController: UIViewController {
    
    
    @IBOutlet weak var titleLabel: CLTypingLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        titleLabel.text = "⚡️FlashChat"
        
//        titleLabel.text = ""
//        var characterIndex = 0.0
//        let titleText = "⚡️FlashChat"
//        for letter in titleText {
//            Timer.scheduledTimer(withTimeInterval: 0.1 * characterIndex, repeats: false) { (timer) in
//                self.titleLabel.text?.append(letter)
//            }
//            characterIndex += 1
//        }
        
        
    }
    
}

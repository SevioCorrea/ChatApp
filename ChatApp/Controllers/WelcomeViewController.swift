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
        
        
        titleLabel.text = K.appName
    
    }
    
}

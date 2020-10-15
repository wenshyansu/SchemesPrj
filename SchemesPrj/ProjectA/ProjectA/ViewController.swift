//
//  ViewController.swift
//  ProjectA
//
//  Created by WEN-HSIEN SU on 2020/10/15.
//  Copyright © 2020 wistron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let schemes: String = "com.wistron.ProjectB://"
    
    @IBOutlet var showInstallAppLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let _ = self.checkIsInstallProjectB()
    }
    
    @IBAction func openProjectB(sender: UIButton) {
        
        if self.checkIsInstallProjectB() {
            UIApplication.shared.open(URL(string: schemes)!, options: [:]) { (isOpen) in
            }
        } else {
            
            let alert = UIAlertController.init(title: "", message: "Please Install ProjectB", preferredStyle: .alert)
            let actionOk = UIAlertAction.init(title: "OK", style: .default) { (action) in
            }
            alert.addAction(actionOk)
            
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func checkIsInstallProjectB() -> Bool {
        
        if UIApplication.shared.canOpenURL(URL(string: schemes)!) {
            
            self.showInstallAppLabel.text = "Installed ProjectB"
            return true
        } else {
            self.showInstallAppLabel.text = "No Install ProjectB"
            return false
        }
    }
}


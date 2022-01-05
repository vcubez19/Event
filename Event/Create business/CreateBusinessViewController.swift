//
//  CreateBusinessViewController.swift
//  Event
//
//  Created by Vincent Cubit on 12/31/21.
//


import UIKit


class CreateBusinessViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var nameOfBusinessTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Create a new business"
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.view.backgroundColor = .systemBackground
        
        
        self.nameOfBusinessTextField.delegate = self
        self.nameOfBusinessTextField.layer.masksToBounds = true
        self.nameOfBusinessTextField.layer.borderWidth = 1.0
        self.nameOfBusinessTextField.layer.borderColor = UIColor.systemGray4
            .cgColor
        self.nameOfBusinessTextField.layer.cornerRadius = 13.0
        
        
        self.navigationItem.leftBarButtonItem?.target = self
        self.navigationItem.leftBarButtonItem?.action = #selector(self.cancel)
        
        
    }
    
    
    @objc private func cancel() {
        self.dismiss(animated: true, completion: nil)
    }

 
    
    @IBAction func clickedNext(_ sender: Any) {
        if let text = self.nameOfBusinessTextField.text {
                UserDefaults.standard.set(text, forKey: "businessName")
        }
        
        
        if self.nameOfBusinessTextField.text!.count > 0 {
            
            let vc = BusinessLocationViewController()
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.clickedNext(self)
        return true
    }
    
    
}


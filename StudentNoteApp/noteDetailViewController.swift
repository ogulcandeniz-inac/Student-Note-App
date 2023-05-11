//
//  noteDetailViewController.swift
//  StudentNoteApp
//
//  Created by Oğulcan Deniz İnaç on 10.05.2023.
//

import UIKit

class noteDetailViewController: UIViewController {

    @IBOutlet weak var textFieldClassName: UITextField!
    
    @IBOutlet weak var textFieldNote1: UITextField!
    
    
    @IBOutlet weak var textFieldNote2: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func noteClear(_ sender: Any) {
        print("sil")
    }
    
    @IBAction func noteUpdate(_ sender: Any) {
        print("güncelle")
    }
}

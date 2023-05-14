//
//  addNoteViewController.swift
//  StudentNoteApp
//
//  Created by Oğulcan Deniz İnaç on 10.05.2023.
//

import UIKit
protocol AddNoteDelegate: AnyObject {
    func didAddNoteWithClassName(_ className: String, note1: Int, note2: Int)
}

class addNoteViewController: UIViewController {

    @IBOutlet weak var textFieldClassName: UITextField!
    @IBOutlet weak var textFieldNote1: UITextField!
    @IBOutlet weak var textFieldNote2: UITextField!
    weak var delegate: AddNoteDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func noteAdd(_ sender: Any) {
            if let ad = textFieldClassName.text, let note1 = textFieldNote1.text, let note2 = textFieldNote2.text {
                
                if let n1 = Int(note1), let n2 = Int(note2) {
                    delegate?.didAddNoteWithClassName(ad, note1: n1, note2: n2)
                }
                
            }
            dismiss(animated: true, completion: nil)
        
        
        
        }
    
    
    func noteAdd(class_name:String,note1:Int,note2:Int){
        
        var request = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/notlar/insert_not.php")!)
        request.httpMethod = "POST"
        let postString = "class_name=\(class_name)&note1=\(note1)&note2=\(note2)"
        request.httpBody = postString.data(using: .utf8)
        
        URLSession.shared.dataTask(with: request) { data,response,error in
            if error != nil || data == nil {
                print("Error")
                return
            }
            
            do{
                if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String:Any]{
                    print(json)
                }

            }catch{
                print(error.localizedDescription)
            }
        }.resume()
    }
}

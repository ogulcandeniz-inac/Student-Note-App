//
//  noteDetailViewController.swift
//  StudentNoteApp
//
//  Created by Oğulcan Deniz İnaç on 10.05.2023.
//

import UIKit

class noteDetailViewController: UIViewController {
    var note:Notes?
    @IBOutlet weak var textFieldClassName: UITextField!
    @IBOutlet weak var textFieldNote1: UITextField!
    @IBOutlet weak var textFieldNote2: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        if let n = note {
            textFieldClassName.text = n.class_name
            textFieldNote1.text = n.note1
            textFieldNote2.text = n.note2
        }
    }
    

    @IBAction func noteClear(_ sender: Any) {
        if let n = note {
            
            if let nid = Int(n.note_id!) {
                noteClear(note_id: nid)
            }
        }
    }
    
    @IBAction func noteUpdate(_ sender: Any) {
        if let n = note,let ad = textFieldClassName.text,let note1 = textFieldNote1.text,let note2 = textFieldNote2.text {
            
            if let nid = Int(n.note_id!),let n1 = Int(note1),let n2 = Int(note2) {
                
                noteUpdate(note_id: nid, class_name: ad, note1: n1, note2: n2)
            }
            
        }
    }
    
    func noteUpdate(note_id:Int,class_name:String,note1:Int,note2:Int){
        
        var request = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/notlar/update_not.php")!)
        request.httpMethod = "POST"
        let postString = "note_id=\(note_id)&class_name=\(class_name)&note1=\(note1)&not2=\(note2)"
        request.httpBody = postString.data(using: .utf8)
        
        URLSession.shared.dataTask(with: request) { data,response,error in
            if error != nil || data == nil {
                print("Hata")
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
    
    func noteClear(note_id:Int){
        
        var request = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/notlar/delete_not.php")!)
        request.httpMethod = "POST"
        let postString = "note_id=\(note_id)"
        request.httpBody = postString.data(using: .utf8)
        
        URLSession.shared.dataTask(with: request) { data,response,error in
            if error != nil || data == nil {
                print("Hata")
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

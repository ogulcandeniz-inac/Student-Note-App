//
//  ViewController.swift
//  StudentNoteApp
//
//  Created by Oğulcan Deniz İnaç on 10.05.2023.
//

import UIKit
class ViewController: UIViewController {

    @IBOutlet weak var noteTableView: UITableView!
    
    var noteList = [Notes]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        noteTableView.delegate = self
        noteTableView.dataSource = self
       
    }
    override func viewWillAppear(_ animated: Bool) {
        tumNotlarAl()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toNoteDetail" {
            let indeks = sender as? Int
            
            let gidilecekVC = segue.destination as! noteDetailViewController
            
            gidilecekVC.note = noteList[indeks!]
            
        }
    }
    func tumNotlarAl(){
        let url = URL(string: "http://kasimadalan.pe.hu/notlar/tum_notlar.php")!
        
        URLSession.shared.dataTask(with: url) { data,response,error in
            if error != nil || data == nil {
                print("Hata")
                return
            }
            
            do{
                let cevap = try JSONDecoder().decode(NotesReply.self, from: data!)
                
                if let gelenNotListesi = cevap.notes {
                    self.noteList = gelenNotListesi
                }else{
                    self.noteList = [Notes]()
                }
                
                DispatchQueue.main.async {
                    
                    var toplam = 0
                    for n in self.noteList {
                        
                        if let n1 = Int(n.note1!),let n2 = Int(n.note2!) {
                             toplam = toplam + (n1+n2)/2
                        }
                       
                    }
                    
                    if self.noteList.count != 0 {
                        self.navigationItem.prompt = "Ortalama : \(toplam / self.noteList.count)"
                    }else{
                        self.navigationItem.prompt = "Ortalama : YOK"
                    }
                    
                    self.noteTableView.reloadData()
                }
            }catch{
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    
    
    
}

extension ViewController: UITableViewDataSource,UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noteList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let note = noteList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath) as! noteCellTableViewCell
        cell.labelClass.text = note.class_name
        cell.labelNote1.text = String(note.note1!)
        cell.labelNote2.text = String(note.note2!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toNoteDetail", sender: indexPath.row)
    }
}

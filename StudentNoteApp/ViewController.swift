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
        
        let n1 = Notes(note_id: 1, class_name: "Tarih", note1: 30, note2: 50)
        let n2 = Notes(note_id: 2, class_name: "Fizik", note1: 50, note2: 20)
        
        
        noteList.append(n1)
        noteList.append(n2)
        
        noteTableView.delegate = self
        noteTableView.dataSource = self
       
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
}

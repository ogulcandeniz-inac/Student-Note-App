//
//  ViewController.swift
//  StudentNoteApp
//
//  Created by Oğulcan Deniz İnaç on 10.05.2023.
//

import UIKit
import Alamofire
class ViewController: UIViewController {

    @IBOutlet weak var noteTableView: UITableView!
    
    var noteList = [Notes]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        noteTableView.delegate = self
        noteTableView.dataSource = self
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          
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

//
//  Notes.swift
//  StudentNoteApp
//
//  Created by Oğulcan Deniz İnaç on 10.05.2023.
//

import Foundation

class Notes:Codable {
    var note_id:String?
    var class_name:String?
    var note1:String?
    var note2:String?
    
    init(note_id: String?, class_name: String?, note1: String?, note2: String?) {
        self.note_id = note_id
        self.class_name = class_name
        self.note1 = note1
        self.note2 = note2
    }
}

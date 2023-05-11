//
//  Notes.swift
//  StudentNoteApp
//
//  Created by Oğulcan Deniz İnaç on 10.05.2023.
//

import Foundation

class Notes {
    var note_id:Int?
    var class_name:String?
    var note1:Int?
    var note2:Int?
    
    init(note_id: Int?, class_name: String?, note1: Int?, note2: Int?) {
        self.note_id = note_id
        self.class_name = class_name
        self.note1 = note1
        self.note2 = note2
    }
}

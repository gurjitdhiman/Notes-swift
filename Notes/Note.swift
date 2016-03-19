//
//  Note.swift
//  Notes
//
//  Created by Gurpartap Singh on 07/03/16.
//  Copyright © 2016 Example. All rights reserved.
//

import UIKit

// 7. Note struct
struct Note {
    var id: Int?
    var title: String
    var contents: String?
    var priority: Int
    var createdAt: NSDate
    
    // 8. Costruct to create and initilize new note.
    init(id: Int?, title: String, contents: String?, priority: Int, created_at: NSDate) {
        self.id = id
        self.title = title
        self.contents = contents
        self.priority = priority
        self.createdAt = created_at
    }
        
}


// 9. counter for inserted note ids
var count = 0

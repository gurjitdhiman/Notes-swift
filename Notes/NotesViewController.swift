//
//  NotesViewController.swift
//  Notes
//
//  Created by Gurpartap Singh on 04/03/16.
//  Copyright © 2016 Example. All rights reserved.
//

import UIKit


// 6. Inherit table view deligate and table view data shouce clasess to use its fuctions
class NotesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // 10. make an array of notes
    var notes:[Note] = []

    @IBOutlet weak var tableView: UITableView!
    
    // INITIAL VIEW LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 11. Set Table View data sourse and
        tableView.dataSource = self
        tableView.delegate = self
        
        
        // 15. Add button on navigation bar to add note
        let addBUtton = UIBarButtonItem(title: "Add Note", style: UIBarButtonItemStyle.Plain, target: self, action: Selector("addNotePressed"))
        self.navigationItem.rightBarButtonItem = addBUtton
        
        self.hidesBottomBarWhenPushed = true
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "notesCell")
    }
    
    
    // 12. Table view library fuction to initilize no of table views.
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Bundle of
        return 1
    }
    
     // 13. Table view library fuction to initilize total no of cells
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Number of notes in array to set table view max lenth.
        return notes.count
    }
    
    
    // 14. Customize Each cell view.
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "notesCell")
        
        let note = notes[indexPath.row]
        
        cell.textLabel?.text = note.title
        
        //cell.accessoryType = UITableViewCellAccessoryType.DetailDisclosureButton
        
        if let contents = note.contents {
            if contents.characters.count >= 8{
                cell.detailTextLabel?.text = contents.substringToIndex(contents.startIndex.advancedBy(8)).stringByAppendingString("...")
            } else {
                cell.detailTextLabel?.text = contents
            }
        }
        
        return cell
    }
    
    // 25. Add UITableViewDelegate fuction to make fuctionalaty when tap on table view cell.
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let destination = ShowNoteViewController()
        destination.deligate = self
        destination.note = notes[indexPath.row]
        // Use ShowNoteViewController as navigationController
        navigationController?.pushViewController(destination, animated: true)
    }
    
/*    
    func tableView(tableView: UITableView, accessoryButtonTappedForRowWithIndexPath indexPath: NSIndexPath) {
        let alertController = UIAlertController(title: "Info", message: "Title \n Created At", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
*/

    // 36. Delete note by swipe left.
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            notes.removeAtIndex(indexPath.row)
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            // handle delete (by removing the data from your array and updating the tableview)
        }
    }
    
    
    // 16. Function to shift controll to addEditNotesViewController to add a note when press on "Add note" button.
    func addNotePressed() {
        let addEditNoteViewController = AddEditNoteViewController(nibName: "AddEditNoteView", bundle: nil)
        addEditNoteViewController.deligate = self
        addEditNoteViewController.title = "Add Note"
        let navController = UINavigationController(rootViewController: addEditNoteViewController)
        self.presentViewController(navController, animated: true, completion: nil)
    }
    
    // 35. Func to Update given note by find it in note array.
    func updateNote(note: Note) {
        var i = 0;
        for noteObj in notes {
            if(note.id == noteObj.id){
                notes[i] = note
                break
            }
            i++
        }
        self.tableView.reloadData()
    }
    
    // 24. Add New Node and reload table view
    func saveNote(note: Note) {
        notes.append(note)
        self.tableView.reloadData()
    }

}

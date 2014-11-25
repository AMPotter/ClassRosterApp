//
//  ViewController.swift
//  ClassRoster
//
//  Created by Andrew Potter on 11/3/14.
//  Copyright (c) 2014 Andrew Potter. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var people = [Person]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let peopleFromArchive = self.loadFromArchive() as [Person]? {
            self.people = peopleFromArchive
        } else {
            self.loadFromPlist()
            self.saveToArchive()
        }
        
        var hasLaunched = NSUserDefaults.standardUserDefaults().boolForKey("firstTime")
        
        if hasLaunched == false {
            println("first launch")
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "firstTime")
        }
        

        self.tableView.dataSource = self
        
        self.title = "Class Roster"
        self.tableView.dataSource = self

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
        self.saveToArchive()
    }
    
    func loadFromArchive() -> [Person]? {
        let documentsPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        
        if let peopleFromArchive = NSKeyedUnarchiver.unarchiveObjectWithFile(documentsPath + "/archive1") as? [Person] {
            return peopleFromArchive
        }
        return nil
    }
    
    func saveToArchive() {
        let documentsPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        NSKeyedArchiver.archiveRootObject(self.people, toFile: documentsPath + "/archive1")
    }
    
    func loadFromPlist() {
        let plistURL = NSBundle.mainBundle().pathForResource("StudentList", ofType: "plist")
        let plistArray = NSArray(contentsOfFile: plistURL!)
        for object in plistArray! {
            println("looped!")
            if let personDictionary = object as? NSDictionary {
                let firstName = personDictionary["First Name"] as String
                let lastName = personDictionary["Last Name"] as String
                let studentStatus = personDictionary["Status"] as String
                var person = Person(firstName: firstName, lastName: lastName, studentStatus: studentStatus)
                self.people.append(person)
            }
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("PERSON_CELL", forIndexPath: indexPath) as PersonTableViewCell
        var personForCell = self.people[indexPath.row]
        cell.nameLabel.text = personForCell.returnName()
        cell.studentLabel.text = personForCell.studentStatus
        cell.personImageView.image = personForCell.image
        cell.personImageView.backgroundColor = UIColor.purpleColor()
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.people.count
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "PERSON_DETAIL" {
            let destinationVC = segue.destinationViewController as DetailViewController
            var selectedIndexPath = self.tableView.indexPathForSelectedRow()
            destinationVC.selectedPerson = self.people[selectedIndexPath!.row]
        }
    }

}

//
//  ViewController.swift
//  ClassRoster
//
//  Created by Andrew Potter on 11/3/14.
//  Copyright (c) 2014 Andrew Potter. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var people = [Person]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Class Roster"
        self.tableView.dataSource = self
        
        var andrewPotter = Person(firstName: "Andrew", lastName: "Potter", isStudent: true)
        var troyStollery = Person(firstName: "Troy", lastName: "Stollery", isStudent: false)
        self.people.append(andrewPotter)
        self.people.append(troyStollery)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PERSON_CELL", forIndexPath: indexPath) as UITableViewCell
        
        var cellPopulation = self.people[indexPath.row]
        cell.textLabel.text = cellPopulation.returnName()
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.people.count
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("PERSON_DETAIL", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "PERSON_DETAIL" {
            let detailViewController = segue.destinationViewController as DetailViewController
            let selectedIndexPath = self.tableView.indexPathForSelectedRow()
            var personToPass = self.people[selectedIndexPath!.row]
            detailViewController.selectedPerson = personToPass
        }
    }

}

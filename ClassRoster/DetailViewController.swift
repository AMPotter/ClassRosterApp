//
//  DetailViewController.swift
//  ClassRoster
//
//  Created by Andrew Potter on 11/5/14.
//  Copyright (c) 2014 Andrew Potter. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var selectedFirstNameLabel: UILabel!
    @IBOutlet var selectedLastNameLabel: UILabel!
    
    var selectedPerson = Person(firstName: "John", lastName: "Doe", isStudent: true)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.selectedPerson.returnName()
        
        self.selectedFirstNameLabel.text = self.selectedPerson.firstName
        self.selectedLastNameLabel.text = self.selectedPerson.lastName
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

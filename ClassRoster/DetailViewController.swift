//
//  DetailViewController.swift
//  ClassRoster
//
//  Created by Andrew Potter on 11/5/14.
//  Copyright (c) 2014 Andrew Potter. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var textFieldFirstName: UITextField!
    @IBOutlet var textFieldLastName: UITextField!
    @IBOutlet var imageView: UIImageView!
    var imagePickerController = UIImagePickerController()

    
    var selectedPerson = Person(firstName: "John", lastName: "Doe", isStudent: true)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageView.image = selectedPerson.image
        self.title = self.selectedPerson.returnName()
        self.textFieldFirstName.delegate = self
        self.textFieldLastName.delegate = self
        
        self.textFieldFirstName.placeholder = self.selectedPerson.firstName
        self.textFieldLastName.placeholder = self.selectedPerson.lastName
        
        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
        //textFieldFirstName.resignFirstResponder()
        //textFieldLastName.resignFirstResponder()
    }

    @IBAction func cameraButtonPressed(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary) {
            self.imagePickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            
            self.imagePickerController.delegate = self
            
            self.imagePickerController.allowsEditing = true
            self.presentViewController(self.imagePickerController, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        let image = info[UIImagePickerControllerEditedImage] as UIImage
        self.imageView.image = image
        
        imagePickerController.dismissViewControllerAnimated(true, completion: nil)
        self.selectedPerson.image = image
        
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

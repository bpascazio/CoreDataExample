//
//  ViewController.swift
//  CoreDataExample
//
//  Created by Bob Pascazio on 11/23/15.
//  Copyright © 2015 NYCDA. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var licenseField: UITextField!
    
    @IBOutlet weak var makeField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func createCar() -> Car? {
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        let entity = NSEntityDescription.entityForName("Car", inManagedObjectContext: managedContext)
        
        let car:Car? = NSManagedObject(entity: entity!,
            insertIntoManagedObjectContext:managedContext) as? Car
        
        return car
    }
    
    func saveContext() {
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        do {
            
            try managedContext.save()
        } catch let error as NSError {
            
            print("save failed: \(error.localizedDescription)")
        }
    }
    
    @IBAction func saveHit(sender: AnyObject) {
        
        let car = createCar()
        if let car_ = car {
            
            car_.make = makeField.text
            car_.license = licenseField.text
        }
        saveContext()
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func cancelHit(sender: AnyObject) {

        dismissViewControllerAnimated(true, completion: nil)
    }
}


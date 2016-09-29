//
//  DataController.swift
//  Coursework Management Tool
//
//  Created by Zakariya Kassim on 05/05/2016.
//  Copyright © 2016 MACBOOKPRO. All rights reserved.
//

import UIKit
import CoreData
class DataController: NSObject {
    
    var managedObjectContext: NSManagedObjectContext
    
    override  init() {
        // This resource is the same name as your xcdatamodeld contained in your project.
        guard let modelURL = NSBundle.mainBundle().URLForResource("MyCoreData", withExtension:"momd") else {
            fatalError("Error loading model from bundle")
        }
        // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
        guard let mom = NSManagedObjectModel(contentsOfURL: modelURL) else {
            fatalError("Error initializing mom from: \(modelURL)")
        }
        let psc = NSPersistentStoreCoordinator(managedObjectModel: mom)
        self.managedObjectContext = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
        self.managedObjectContext.persistentStoreCoordinator = psc
        
        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        let docURL = urls[urls.endIndex-1]
        /* The directory the application uses to store the Core Data store file.
         This code uses a file named "DataModel.sqlite" in the application's documents directory.
         */
        let storeURL = docURL.URLByAppendingPathComponent("MyCoreData.sqlite")
        do {
            try psc.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: storeURL, options: nil)
        } catch {
            fatalError("Error migrating store: \(error)")
        }
        
    }
    
    
    
    func addModule(name: String, code: String, level: String) {
        
        // create an instance of our managedObjectContext
        // let moc = DataController().managedObjectContext
        
        // we set up our entity by selecting the entity and context that we're targeting
        let entity = NSEntityDescription.insertNewObjectForEntityForName("ModuleData", inManagedObjectContext: managedObjectContext) as! ModuleData
        
        // add our data
        entity.setValue(name, forKey: "name")
        entity.setValue(code, forKey: "code")
        entity.setValue(level, forKey: "level")
        
        // we save our entity
        do {
            try managedObjectContext.save()
        } catch {
            fatalError("Failure to save context: \(error)")
        }
    }
    
    
    
    
    
    func fetchModules() -> Array<String> {
        
        var list = [String]()
        let fetch = NSFetchRequest(entityName: "ModuleData")
        
        do {
            let fetched = try self.managedObjectContext.executeFetchRequest(fetch) as! [ModuleData]
            
            if fetched.count > 0 {
              //  print(fetched.first!.name!)
                
                
                for m in fetched {
                    if let name = m.name {
                        list.insert(name, atIndex: 0)
                        
                    }            }
                
            }
            
        } catch {
            fatalError("Failed to fetch: \(error)")
        }
        return list
        
    }
    
    
    
    func deleteAll() {
        
        
        let fetch = NSFetchRequest(entityName: "ModuleData")
        
        do {
            let fetched = try self.managedObjectContext.executeFetchRequest(fetch) as! [ModuleData]
            
            if fetched.count > 0 {
                
                for result: AnyObject in fetched{
                    managedObjectContext.deleteObject(result as! NSManagedObject)
                    print("NSManagedObject has been Deleted")
                }
                try managedObjectContext.save() } } catch {}
    }
    
    
  /*  func update() {
        let fetch = NSFetchRequest(entityName: "ModuleData")
        
        
        do {
             let fetched = try self.managedObjectContext.executeFetchRequest(fetch) as! [ModuleData]
            fetched.first?.FirstPropertyToUpdate = "zak"
            fetched.first?.SecondPropertyToUpdate = NewValue
            // ... Update additional properties with new values
        } catch {
            // Do something in response to error condition
        }
        
        do {
            try self.managedObjectContext.save()
        } catch {
            // Do something in response to error condition
        }
    } */
    
    
    
    func deleteEach(ref: String){
         let fetch = NSFetchRequest(entityName: "ModuleData")
        
        do {
            let fetched = try self.managedObjectContext.executeFetchRequest(fetch) as! [ModuleData]
            
            for x in fetched {
                if x.name!.containsString(ref) {
                    print("found")
                     self.managedObjectContext.deleteObject(x)
                    
                }
            }
     
            saveContext()
            
        } catch {
            fatalError("Failed to fetch: \(error)")
        }

        

    }
    
    
    func saveContext () {
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
                abort()
            }
        }
    }
    
    
    
    func fetchAll() -> Array<Module> {
        
        var modules = [Module]()
        
        let fetch = NSFetchRequest(entityName: "ModuleData")
        // var fetched: ModuleData?
        
        do {
            let fetched = try self.managedObjectContext.executeFetchRequest(fetch) as! [ModuleData]
            
            if fetched.count > 0 {
               // print(fetched.first!.name!)
                
                
                for m in fetched {
                    if let name = m.name {
                        modules.insert(Module(name:  name, code: "0000"), atIndex: 0)
                    }            }
                
            }
            
        } catch {
            fatalError("Failed to fetch: \(error)")
        }
        
        return modules
        
    }
    
    
}
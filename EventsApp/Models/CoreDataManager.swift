//
//  CoreDataManager.swift
//  EventsApp
//
//  Created by Saulo Garcia on 9/22/20.
//

import CoreData
import UIKit

final class CoreDataManager {
    lazy var persistanContainer: NSPersistentContainer = {
        let persistanContainer = NSPersistentContainer(name: "EventsApp")
        persistanContainer.loadPersistentStores { _, error in
            print(error?.localizedDescription ?? "")
        }
        return persistanContainer
    }()
    
    var moc: NSManagedObjectContext {
        persistanContainer.viewContext
    }
    
    func saveEvent(name: String, date: Date, image: UIImage) {
        let event = Event(context: moc)
        event.setValue(name, forKey: "name")
        event.setValue(date, forKey: "date")
        let imageData = image.jpegData(compressionQuality: 1)
        event.setValue(imageData, forKey: "image")
        
        do {
            try moc.save()
        } catch {
            print(error)
        }
    }
    
    func fetchEvents() -> [Event] {
        do {
            let fetchRequests = NSFetchRequest<Event>(entityName: "Event")
            let events = try moc.fetch(fetchRequests)
            return events
        } catch {
            print(error)
            return []
        }
    }
    
}

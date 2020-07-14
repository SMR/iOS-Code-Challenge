//
//  NSManagedObjectContext+Extensions.swift
//  iOS-Code-Challenge
//
//  Created by iSparshiT on 14/07/20.
//  Copyright © 2020 iSparshit. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension NSManagedObjectContext {
    
    static var current: NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
}

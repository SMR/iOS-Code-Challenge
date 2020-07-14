////
////  CoreDataManager.swift
////  iOS-Code-Challenge
////
////  Created by iSparshiT on 14/07/20.
////  Copyright © 2020 iSparshit. All rights reserved.
////
//
//import Foundation
//import CoreData
//
//static let shared = CoreDataManager(moc: NSManagedObjectContext.current)
//
//var moc: NSManagedObjectContext
//
//private init(moc: NSManagedObjectContext) {
//    self.moc = moc
//}
//
//private func fetchChallenge(id: String, type: String, date: String,data:String) -> ChallengeDTO? {
//
//    var Challenges = [ChallengeDTO]()
//
//    let request: NSFetchRequest<ChallengeDTO> = ChallengeDTO.fetchRequest()
//    request.predicate = NSPredicate(format: "name == %@", name)
//
//    do {
//        Challenges = try self.moc.fetch(request)
//    } catch let error as NSError {
//        print(error)
//    }
//
//    return Challenges.first
//
//}
//
//func deleteChallange(id: String, type: String, date: String,data:String) {
//
//    do {
//        if let challenge = fetcChallenge(id: id,type:type,date:date,data:data) {
//            self.moc.delete(challenge)
//            try self.moc.save()
//        }
//    } catch let error as NSError {
//        print(error)
//    }
//
//}
//
//
//func getChallange() -> [ChallengeDTO] {
//
//    var challenge = [ChallengeDTO]()
//
//    let challengeRequest: NSFetchRequest<challenge> = ChallengeDTO.fetchRequest()
//
//    do {
//        challenge = try self.moc.fetch(challengeRequest)
//    } catch let error as NSError {
//        print(error)
//    }
//
//    return challenge
//
//}
//
//func saveChallange(id: String, type: String, date: String,data:String) {
//
//    let challenge =  Challenge(context self.moc)
//    challenge.id = id
//    challenge.type = type
//    challenge.date = date
//    challenge.data = date
//
//    do {
//        try moc.save()
//    } catch let error as NSError {
//        print(error)
//    }
//
//}

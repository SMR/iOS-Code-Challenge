//
//  CombineChallengeDTO.swift
//  iOS-Code-Challenge
//
//  Created by iSparshiT on 14/07/20.
//  Copyright © 2020 iSparshit. All rights reserved.
//

import Foundation
import Combine

struct CombineChallengeDTO:Codable{
      let id: String
      let type: String
      let date: String
      let data: String
    
    enum CodingKeys: String, CodingKey {
           case id
           case type
           case date
           case data
       }
    
    init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = (try container.decodeIfPresent(String.self, forKey: .id)) ?? "NO DATA"
        type = (try container.decodeIfPresent(String.self, forKey: .type)) ?? "NO DATA"
        date = (try container.decodeIfPresent(String.self, forKey: .date)) ?? "NO DATA"
        data = (try container.decodeIfPresent(String.self, forKey: .data)) ?? "NO DATA"
    }
   
}

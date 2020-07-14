//
//  API.swift
//  iOS-Code-Challenge
//
//  Created by iSparshiT on 14/07/20.
//  Copyright © 2020 iSparshit. All rights reserved.
//

import Foundation
import Combine

enum CombineAPI{
    static let imageBase = URL(string: "")!

    private static let base = URL(string:"https://raw.githubusercontent.com/AxxessTech/Mobile-Projects/master/challenge.json")!
        private static let agent = Agent()
    
        static func getData() -> AnyPublisher<PageDTO<CombineChallengeDTO>, Error> {
        let request = URLRequest(url: base)
        return agent.run(request)
    }
}



private extension URLComponents {
    func addingApiKey(_ apiKey: String) -> URLComponents {
        var copy = self
        copy.queryItems = [URLQueryItem(name: "api_key", value: apiKey)]
        return copy
    }
    
    var request: URLRequest? {
        url.map { URLRequest.init(url: $0) }
    }
}


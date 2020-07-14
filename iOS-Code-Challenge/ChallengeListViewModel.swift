//
//  ChallengeListViewModel.swift
//  iOS-Code-Challenge
//
//  Created by iSparshiT on 14/07/20.
//  Copyright © 2020 iSparshit. All rights reserved.
//

import Foundation
import Combine

final class ChallengeListViewModel: ObservableObject {
    
    @Published private(set) var state = State.idle
        
        private var bag = Set<AnyCancellable>()
        
        private let input = PassthroughSubject<Event, Never>()
        
        init() {
            Publishers.system(
                initial: state,
                reduce: Self.reduce,
                scheduler: RunLoop.main,
                feedbacks: [
                    Self.whenLoading(),
                    Self.userInput(input: input.eraseToAnyPublisher())
                ]
            )
            .assign(to: \.state, on: self)
            .store(in: &bag)
        }
        
        deinit {
            bag.removeAll()
        }
        
        func send(event: Event) {
            input.send(event)
        }
    

}
// MARK: - Inner Types
extension ChallengeListViewModel{
    enum State {
        case idle
        case loading
        case loaded([ChallangeListItem])
        case error(Error)
    }
    enum Event{
        case onAppear
        case onSelectedChallenge(Int)
        case onLoadedChallenge([ChallangeListItem])
        case onFailedToChallenge(Error)
    }
    struct ChallangeListItem:Identifiable{
        let id : String
        let type:String
        let date:String
        let data:String
        
        init(challenge:CombineChallengeDTO){
        
        id = challenge.id
        type = challenge.type
        date = challenge.date
        data = challenge.data
            
        }
    
    }

}

// MARK: - State Machine
extension ChallengeListViewModel{
    
      static func reduce(_ state: State, _ event: Event) -> State {
    
       switch state {
              case .idle:
       switch event {
              case .onAppear:
       return .loading
              default:
              return state
             }
            case .loading:
       switch event {
                case .onFailedToChallenge(let error):
       return .error(error)
                case .onLoadedChallenge(let challenge):
       return .loaded(challenge)
                default:
                    return state
              }
                case .loaded:
                    return state
                case .error:
                    return state
             }
    }
        static func whenLoading() -> Feedback<State, Event> {
            Feedback { (state: State) -> AnyPublisher<Event, Never> in
                guard case .loading = state else { return Empty().eraseToAnyPublisher() }
                return CombineAPI.getData()
                .map { $0.results.map(ChallangeListItem.init) }
                .map(Event.onLoadedChallenge)
                .catch { Just(Event.onFailedToChallenge($0)) }
                .eraseToAnyPublisher()
            
            }
        }
        
        static func userInput(input: AnyPublisher<Event, Never>) -> Feedback<State, Event> {
            Feedback { _ in input }
        }

}



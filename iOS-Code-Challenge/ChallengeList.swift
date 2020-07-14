//
//  ChallengeList.swift
//  iOS-Code-Challenge
//
//  Created by iSparshiT on 14/07/20.
//  Copyright © 2020 iSparshit. All rights reserved.
//
import Combine
import SwiftUI

struct ChallengeList: View {
    
    @State  var challengeDTO : [ChallengeDTO] = []
    
    var body: some View {
        NavigationView {
                List(challengeDTO ,id: \.type) { challengeDTO in
                    VStack(alignment: .leading){
                        NavigationLink("", destination: Text("Type :\(challengeDTO.data)"))
                        ChallengeRow(rowData: challengeDTO)
                    }
                    }
                   .onAppear {
                      ChallengeAPI().getPost{ (challengeDTO) in
                      self.challengeDTO =  challengeDTO
                    }
                }
                .navigationBarTitle("iOS-Code-Challenge")
                }
        
    }
    struct ChallengeRow:View{
        let rowData: ChallengeDTO
        var body: some View {
            VStack(alignment: .leading){
                Text("ID : \(rowData.id)")
                Text("Type :\(rowData.type)")
                Text("Date : \(rowData.date)")
                Text("Data : \(rowData.data)")
            }
        }
    }
    
//------------------------Using Combine Framwork-----------------//
    
//    @ObservedObject var viewModel: ChallengeListViewModel
//
//       var body: some View {
//           NavigationView {
//
//               content
//               .navigationBarTitle("iOS-Code-Challenge")
//
//           }
//           .onAppear { self.viewModel.send(event: .onAppear) }
//       }
//
//       private var content: some View {
//           switch viewModel.state {
//           case .idle:
//               return Color.clear.eraseToAnyView()
//           case .loading:
//              return Spinner(isAnimating: true, style: .large).eraseToAnyView()
//           case .error(let error):
//               return Text(error.localizedDescription).eraseToAnyView()
//           case .loaded(let challenge):
//               return list(of: challenge).eraseToAnyView()
//           }
//       }
//
//    private func list(of challenge: [ChallengeListViewModel.ChallangeListItem]) -> some View {
//        return List(challenge, id : \.type) {challenge in
//            Text(challenge.type)
//            NavigationLink("", destination: ChallengeDetailView()
//
//               )
//           }
//       }
    
}

struct ChllengeListItemView:View{
    
    let challenge:ChallengeListViewModel.ChallangeListItem
    
    @Environment(\.imageCache) var cache: ImageCache
    
    var body: some View {
           VStack {
              title
           }
       }
    
    private var title:some  View{
        Text(challenge.type)
        //Text(challenge.data)
        .font(.title)
        .frame(idealWidth: .infinity, maxWidth: .infinity, alignment: .center)
    }
//    private var poster: some View {
//        challenge.poster.map { url in
//            AsyncImage(
//                url: url,
//                cache: cache,
//                placeholder: spinner,
//                configuration: { $0.resizable().renderingMode(.original) }
//            )
//        }
//        //.aspectRatio(contentMode: .aspectRatio)
//        .frame(idealHeight: UIScreen.main.bounds.width / 2 * 3) // 2:3 aspect ratio
//    }

    private var spinner: some View {
           Spinner(isAnimating: true, style: .medium)
       }
}

struct ChallengeList_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeList()
    }
}

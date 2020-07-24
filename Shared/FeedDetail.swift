//
//  FeedDetail.swift
//  Feed Prototype
//
//  Created by Tassilo Bouwman on 18/07/2020.
//

import SwiftUI

struct FeedDetail: View {
    var post: PostModel
    @State private var zoomed = false
    
    var body: some View {
        VStack {
            Spacer(minLength: 0)
            Image(post.images[0])
                .resizable()
                .aspectRatio(contentMode: zoomed ? .fill : .fit)
                .onTapGesture(count: 2) {
                    withAnimation {
                        zoomed.toggle()
                    }
                }
            Spacer(minLength: 0)
            
            if !zoomed {
                HStack {
                    Spacer()
                    Label(post.sportType, systemImage: "figure.walk")
                        .padding(.all)
                        .font(Font.headline.smallCaps())
                        .foregroundColor(.white)
                    Spacer()
                }
                .background(Color.green)
                .transition(.move(edge: .bottom))
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .navigationTitle(post.title)
    }
}

struct FeedDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            FeedDetail(post: testData[0])
        }
    }
}

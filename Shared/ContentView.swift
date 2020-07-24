//
//  ContentView.swift
//  Shared
//
//  Created by Tassilo Bouwman on 11/07/2020.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var store: FeedStore
    
    var body: some View {
        NavigationView {
            FeedList(store: store)
                .navigationTitle("Feed")
            
            Text("Select a post")
                .font(.largeTitle)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(store: testStore)
                .preferredColorScheme(.dark)
                .environment(\.sizeCategory, .extraExtraExtraLarge)
        }
    }
}

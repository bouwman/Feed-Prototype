//
//  FeedStore.swift
//  Feed Prototype
//
//  Created by Tassilo Bouwman on 19/07/2020.
//

import Foundation

class FeedStore: ObservableObject {
    @Published var posts: [PostModel]
    
    init(posts: [PostModel] = []) {
        self.posts = posts
    }
}

let testStore = FeedStore(posts: testData)

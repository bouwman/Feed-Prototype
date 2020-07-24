//
//  FeedList.swift
//  Feed Prototype
//
//  Created by Tassilo Bouwman on 11/07/2020.
//

import SwiftUI

struct FeedList: View {
    @ObservedObject var store: FeedStore
    
    var body: some View {
        List() {
            ForEach(store.posts) { post in
                ZStack {
                    VStack(alignment: .leading, spacing: 16.0) {
                        FeedUserRow(post: post)
                        Text(post.title)
                        FeedStatsRow(values: post.values)
                        FeedImageRow(images: post.images)
                    }
                    .padding(.vertical)
                    NavigationLink(destination: FeedDetail(post: post)) {
                        EmptyView()
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .onMove(perform: movePost)
            .onDelete(perform: deletePost)
            
            HStack {
                Spacer()
                Text("\(store.posts.count) Posts")
                    .foregroundColor(.secondary)
                Spacer()
            }
        }
        .toolbar {
            #if os(iOS)
            EditButton()
            #endif
            Button("Add", action: createPost)
        }
    }
    
    func createPost() {
        withAnimation {
            store.posts.append(testData[0])
        }
    }
    
    func movePost(from: IndexSet, to: Int) {
        withAnimation {
            store.posts.move(fromOffsets: from, toOffset: to)
        }
    }
    
    func deletePost(offsets: IndexSet) {
        withAnimation {
            store.posts.remove(atOffsets: offsets)
        }
    }
}

struct FeedList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            FeedList(store: testStore)
                .navigationTitle("Title")
        }
    }
}

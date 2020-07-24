//
//  FeedRow.swift
//  Feed Prototype
//
//  Created by Tassilo Bouwman on 11/07/2020.
//

import SwiftUI

struct FeedUserRow: View {
    var post: PostModel
    var formatter: DateFormatter {
        let aFormatter = DateFormatter()
        aFormatter.dateStyle = .none
        aFormatter.timeStyle = .short
        return aFormatter
    }
    var body: some View {
        
        HStack(alignment: .center, spacing: 16.0) {
            Image(post.userImage)
                .resizedToFill(width: 48.0, height: 48.0)
                .cornerRadius(/*@START_MENU_TOKEN@*/48.0/*@END_MENU_TOKEN@*/)
                
            VStack(alignment: .leading, spacing: 2.0) {
                Text(post.userName)
                    .font(.title3)
                Text(formatter.string(from: post.date))
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    
            }
        }
    }
}

struct LibraryContent: LibraryContentProvider {
    @LibraryContentBuilder
    var views: [LibraryItem] {
        LibraryItem(
            FeedUserRow(post: testData[1]),
            category: .control
        )
        
        LibraryItem(
            FeedUserRow(post: testData[1]),
            title: "Feed Row 2",
            category: .control
        )
    }
    @LibraryContentBuilder
    func modifiers(base: Image) -> [LibraryItem] {
        LibraryItem (
            base.resizedToFill(width: 100.0, height: 100.0)
        )
    }
}

extension Image {
    func resizedToFill(width: CGFloat, height: CGFloat) -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: width, height: height)
    }
}

// MARK: - Previews

struct FeedRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FeedUserRow(post: testData[1])
                .padding()
                .previewLayout(.sizeThatFits)
            FeedUserRow(post: testData[2])
                .preferredColorScheme(.dark)
                .padding()
                .previewLayout(.sizeThatFits)
        }
    }
}

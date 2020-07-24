//
//  FeedImageRow.swift
//  Feed Prototype
//
//  Created by Tassilo Bouwman on 19/07/2020.
//

import SwiftUI

struct FeedImageRow: View {
    var images: [String]
    @State var currentImage: Int = 0
    
    var showTrace: Bool {
        return images[currentImage].contains("map")
    }
    
    var body: some View {
        Image(images[currentImage])
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(minWidth: 0, idealWidth: 375, maxWidth: 500, minHeight: 0, idealHeight: 257, maxHeight: 300, alignment: .center)
            .padding(.horizontal)
            .clipShape(RoundedRectangle(cornerRadius: 16.0, style: .continuous))
            .onTapGesture {
                nextImage()
            }
            .overlay(
                LinearGradient(gradient: Gradient(colors: [Color(white: 0.0, opacity: 0.54), Color(white: 0.0, opacity: 0.0)]), startPoint: .bottom, endPoint: .center)
                    .cornerRadius(16.0)
                    .onTapGesture {
                        nextImage()
                    }
                
            )
            .overlay(
                Group {
                    if images.count > 1 {
                        PageIndicatorBar(numberOfPages: images.count, currentPageIndex: $currentImage)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                    }
                },
                alignment: .top
            )
            .overlay(
                Group {
                    if self.showTrace {
                        Image("trace")
                            .onTapGesture {
                                nextImage()
                            }
                    } else {
                        EmptyView()
                    }
                }
            )
    }
    
    func nextImage() {
        if currentImage < images.count - 1 {
            currentImage += 1
        } else {
            currentImage = 0
        }
    }
}

struct FeedImageRow_Previews: PreviewProvider {
    static var previews: some View {
        FeedImageRow(images: testData[1].images)
    }
}

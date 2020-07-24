//
//  PageIndicatorView.swift
//  Feed Prototype
//
//  Created by Tassilo Bouwman on 19/07/2020.
//

import SwiftUI

struct PageIndicatorBar: View {
    var numberOfPages: Int
    @Binding var currentPageIndex: Int
    
    var body: some View {
        HStack {
            ForEach(0..<numberOfPages) { i in
                Color.init(white: 1.0, opacity: currentPageIndex == i ? 1.0 : 0.3)
                    .cornerRadius(4.0)
            }
        }
        .frame(width: nil, height: 4, alignment: .center)
    }
}

struct PageIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        PageIndicatorBar(numberOfPages: 3, currentPageIndex: .constant(0))
            .background(Color.gray)
    }
}

//
//  PageIndicatorView.swift
//  Feed Prototype
//
//  Created by Tassilo Bouwman on 19/07/2020.
//

import SwiftUI

struct PageIndicatorBar: View {
    var width: CGFloat
    
    var body: some View {
        Color.init(white: 0.0, opacity: 0.3)
            .frame(width: width, height: 6.0, alignment: .center)
            .cornerRadius(4.0)
    }
}

struct PageIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        PageIndicatorBar(width: 200)
    }
}

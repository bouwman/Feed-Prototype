//
//  FeedStatsRow.swift
//  Feed Prototype
//
//  Created by Tassilo Bouwman on 19/07/2020.
//

import SwiftUI

struct FeedStatsRow: View {
    var values: [StatValue]

    var body: some View {
        HStack(alignment: .lastTextBaseline) {
            Label(values[0].formattedValue, systemImage: "location.circle")
                .font(.headline)
            Spacer()
            Label(values[2].formattedValue, systemImage: "timer")
                .font(.headline)
            Spacer()
        }
    }
}

struct FeedStatsRow_Previews: PreviewProvider {
    static var previews: some View {
        FeedStatsRow(values: testData[0].values)
    }
}

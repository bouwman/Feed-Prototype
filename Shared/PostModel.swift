//
//  PostModel.swift
//  Feed Prototype
//
//  Created by Tassilo Bouwman on 18/07/2020.
//

import Foundation

struct PostModel: Identifiable {
    var id = UUID()
    var userName: String
    var userImage: String { return userName.lowercased() }
    var title: String
    var date: Date
    var images: [String]
    var sportType: String
    var values: [StatValue]
}

struct StatValue: Identifiable {
    var id = UUID()
    var value: Measurement<Unit>
    var type: String
    var formattedValue: String {
        return formatter.string(from: value)
    }
    
    private var formatter: MeasurementFormatter {
        let aFormatter = MeasurementFormatter()
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 1
        
        aFormatter.unitStyle = .medium
        aFormatter.numberFormatter = numberFormatter
        
        return aFormatter
    }
}

let testData = [
    PostModel(userName: "Jane", title: "Afternoon Run", date: Date(timeIntervalSinceNow: 3600), images: ["hiking 1", "hiking 2", "hiking 3", "hiking 4"], sportType: "Running", values: values),
    PostModel(userName: "Ralph", title: "Day Hike", date: Date(timeIntervalSinceNow: 7200), images: ["map", "hiking 1", "hiking 3"], sportType: "hiking", values: values),
    PostModel(userName: "Sarah", title: "Morning Walk", date: Date(timeIntervalSinceNow: 10000), images: ["map"], sportType: "hiking", values: values),
    PostModel(userName: "Pedro", title: "Afternoon Workout", date: Date(timeIntervalSinceNow: 13600), images: ["hiking 2", "hiking 1"], sportType: "workout", values: values),
    PostModel(userName: "Zoltan", title: "Afternoon Hike", date: Date(timeIntervalSinceNow: 17200), images: ["map", "hiking 4"], sportType: "hiking", values: values),
    PostModel(userName: "Andi", title: "Morning Hike", date: Date(timeIntervalSinceNow: 220000), images: ["map", "hiking 3", "hiking 4", "hiking 2"], sportType: "hiking", values: values),
    PostModel(userName: "Andi", title: "Morning Hike", date: Date(timeIntervalSinceNow: 1000000), images: ["hiking 4"], sportType: "hiking", values: values)
]

private let value1: Measurement<Unit> = Measurement(value: 23.9, unit: UnitLength.kilometers)
private let value2: Measurement<Unit> = Measurement(value: 3458, unit: UnitLength.meters)
private let value3: Measurement<Unit> = Measurement(value: 240, unit: UnitDuration.minutes)

private let statValue1 = StatValue(value: value1, type: "distance")
private let statValue2 = StatValue(value: value2, type: "elevation")
private let statValue3 = StatValue(value: value3, type: "duration")

private let values: [StatValue] = [statValue1, statValue2, statValue3]

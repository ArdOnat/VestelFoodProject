//
//  Structs.swift
//  VestelFoodProject
//
//  Created by Arda Onat on 1.12.2019.
//  Copyright © 2019 Arda Onat. All rights reserved.
//

import Foundation

struct FoodResponse: Decodable {
    var dailyFoods: [DailyFood]
}

struct DailyFood: Decodable {
    var Date: String
    var F1: String
    var F2: String
    var F3: String
    var F4: String
    var F5: String
}

struct Day: Identifiable {
    var id: Int
    var foodScore: Int
    var dailyFood: DailyFood
    var Date: String
}

struct Food: Identifiable {
    var id : Int
    var foodName: String
    var serveDates = [DateId]()
    var isLiked: Bool
    var isDisliked: Bool
}

struct DateId: Identifiable {
    var id: Int
    var date: String
}

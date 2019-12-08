//
//  Data.swift
//  VestelFoodProject
//
//  Created by Arda Onat on 1.12.2019.
//  Copyright © 2019 Arda Onat. All rights reserved.
//

import Foundation

var dailyFoodData: [DailyFood] = load("aralık2019")
var dayData: [Day] = convertDailyFoodsToDay(dailyFoods: dailyFoodData)
let foodData = getFoods()
//let foodData = convertDailyFoodsToFood(searchText: "")


func load(_ fileName: String) -> [DailyFood] {
    if let url = Bundle.main.url(forResource: fileName, withExtension: "json" ) {
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode([DailyFood].self, from: data)
            return jsonData
        } catch {
            print("error:\(error)")
        }
    }
    return []
}

func convertDailyFoodsToDay(dailyFoods: [DailyFood]) -> [Day]{
    var days = [Day]()
    
    for n in 0...dailyFoods.count - 1 { // Change each month
        var day:Day = Day(id: n+1, foodScore: 0, dailyFood: dailyFoods[n], Date: dailyFoods[n].Date, currentDayFoodNameArray: [dailyFoods[n].F1, dailyFoods[n].F2, dailyFoods[n].F3, dailyFoods[n].F4])
        days.append(day)
    }
    
    return days
}


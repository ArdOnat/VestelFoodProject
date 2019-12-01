//
//  Data.swift
//  VestelFoodProject
//
//  Created by Arda Onat on 1.12.2019.
//  Copyright © 2019 Arda Onat. All rights reserved.
//

import Foundation

let foodData: [DailyFood] = load("kasım2019")
let dayData: [Day] = convertDailyFoodsToDay(dailyFoods: foodData)

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
    
    for n in 1...dailyFoods.count - 1 {
        let day:Day = Day(id: n, foodScore: 0, dailyFood: dailyFoods[n], Date: dailyFoods[n].Date)
        days.append(day)
    }
    
    return days
}

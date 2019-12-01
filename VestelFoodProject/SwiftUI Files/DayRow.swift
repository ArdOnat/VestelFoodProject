//
//  DayRow.swift
//  VestelFoodProject
//
//  Created by Arda Onat on 1.12.2019.
//  Copyright © 2019 Arda Onat. All rights reserved.
//

import SwiftUI

struct DayRow: View {
    let day: Day
    let currentDate: Date
    let screenSize: CGRect = UIScreen.main.bounds
    @State var tag:Int? = nil
    
    var body: some View {
        VStack (alignment: .leading) {
            
            if day.Date.contains("Pazar") && !day.Date.contains("Pazartesi") {
                Text("--------------------------------------------")
            }
            else if !day.Date.contains("Cumartesi") {
                if returnCurrentDay(date: currentDate) == day.id {  
                    HStack {
                        Text(String(day.dailyFood.Date)).font(.headline)
                            .padding(.bottom, 10)
                            .modifier(CurrentDayModifier())
                        Text(String(day.foodScore)).font(.headline)
                            .padding(.bottom, 10)
                            .modifier(CurrentDayModifier())
                    }
                    
                    HStack {
                        Text(String(day.dailyFood.F1)).font(.subheadline)   .lineLimit(nil)
                            .font(.body)
                        Text(String(day.dailyFood.F2)).font(.subheadline)   .lineLimit(nil)
                            .font(.body)
                        Text(String(day.dailyFood.F3)).font(.subheadline)   .lineLimit(nil)
                            .font(.body)
                        Text(String(day.dailyFood.F4)).font(.subheadline)   .lineLimit(nil)
                            .font(.body)
                    }
                }
                else {
                    
                    HStack {
                        Text(String(day.dailyFood.Date)).font(.headline)
                            .padding(.bottom, 10)
                        Text(String(day.foodScore)).font(.headline)
                            .padding(.bottom, 10)
                    }
                
                    HStack {
                        Text(day.dailyFood.F1).lineLimit(nil)
                            .frame(width: (screenSize.width - 40)/4, alignment: .leading)
                        
                        Text(day.dailyFood.F2).lineLimit(nil)
                            .frame(width: (screenSize.width - 40)/4, alignment: .leading)
                        
                        Text(day.dailyFood.F3).lineLimit(nil)
                            .frame(width: (screenSize.width - 40)/4, alignment: .leading)
                        
                        Text(day.dailyFood.F4).lineLimit(nil)
                            .frame(width: (screenSize.width - 40)/4, alignment: .leading)
                    }
                }
            }
        }
    }
}

struct DayRow_Previews: PreviewProvider {
    static var previews: some View {
        let day = Day(id: 0, foodScore: 0, dailyFood: DailyFood(Date: "1", F1: "1", F2: "2", F3: "3", F4: "4", F5: "5"), Date: "Some")
        return DayRow(day: day, currentDate: Date())
    }
}

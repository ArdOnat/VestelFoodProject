//
//  DateTitle.swift
//  VestelFoodProject
//
//  Created by Arda Onat on 1.12.2019.
//  Copyright © 2019 Arda Onat. All rights reserved.
//

import SwiftUI

struct DateTitle: View {
    @EnvironmentObject var userData: UserData
    let date:Date = Date()
    var body: some View {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
     
        return VStack() {
            Text(formatter.string(from: date))
                .bold()
                .animation(.interactiveSpring())
                .foregroundColor(.green)
        
            List  {
                ForEach(userData.days) { day in
                    if day.id != 0 {
                        if !day.Date.contains("Cumartesi") {
                            DayRow(day: day, currentDate: self.date)
                        }
                    }
                }.padding(.init(top:0, leading:0, bottom: 15, trailing:0))
            }
        }
    }
}
struct DateTitle_Previews: PreviewProvider {
    static var previews: some View {
        DateTitle()
            .environmentObject(UserData())
    }
}


//
//  ContentView.swift
//  VestelFoodProject
//
//  Created by Arda Onat on 1.12.2019.
//  Copyright © 2019 Arda Onat. All rights reserved.
//

import SwiftUI

struct DayList: View {
    @EnvironmentObject private var userData: UserData
    @State private var date = Date()
    @State var isActive: Bool = false
    
    var body: some View {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        return NavigationView {
            return VStack() {
                HStack() {
                    NavigationLink(destination: FoodSearchView(), isActive: self.$isActive, label: {
                        Text("")
                    })
                    
                .navigationBarTitle("Food List", displayMode: .inline)
                .navigationBarItems(trailing:
                    Button("Food List") {
                        self.isActive = true
                    })
                }
                DateTitle()
            }
        }
    }
}

struct DayList_Previews: PreviewProvider {
    static var previews: some View {
        DayList()
        .environmentObject(UserData())
    }
}

struct CurrentDayModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
        .background(Color.green)
    }
}

func returnCurrentDay(date: Date) -> Int {
    let calendar = Calendar.current
    let day = calendar.component(.day, from: date)
    return day
}

//
//  FoodSearchView.swift
//  Vestel_Food_Project - First_Version
//
//  Created by Arda Onat on 20.11.2019.
//  Copyright © 2019 Vestel V. All rights reserved.
//

import SwiftUI

func convertDailyFoodsToFood(searchText: String) -> [Food] {
    var foods = [Food]()
    var foodNames = [String]()
    var foodCount = 0
    
    // TO DO: Add isLiked and isDisliked check while creating Food objects.
    // Check it by looping the liked and disliked arrays.
    
    for n in 0...foodData.count - 1 {
        if !foodNames.contains(foodData[n].F1) && foodData[n].F1.hasPrefix(searchText.uppercased()) && foodData[n].F1 != "" {
            var food: Food = Food(id: foodCount, foodName: foodData[n].F1, isLiked: false, isDisliked: false)
                food.addDatesToFood()
                if food.serveDates.count != 0 {
                    foods.append(food)
                    foodNames.append(foodData[n].F1)
                    foodCount += 1
                }
        }
        
        if !foodNames.contains(foodData[n].F2) && foodData[n].F2.hasPrefix(searchText.uppercased()) && foodData[n].F2 != "" {
            var food: Food = Food(id: foodCount, foodName: foodData[n].F2, isLiked: false, isDisliked: false)
                food.addDatesToFood()
                if food.serveDates.count != 0 {
                    foods.append(food)
                    foodNames.append(foodData[n].F2)
                    foodCount += 1
                }
        }
        
        if !foodNames.contains(foodData[n].F3) && foodData[n].F3.hasPrefix(searchText.uppercased()) && foodData[n].F3 != "" {
            var food: Food = Food(id: foodCount, foodName: foodData[n].F3, isLiked: false, isDisliked: false)
                food.addDatesToFood()
                if food.serveDates.count != 0 {
                    foods.append(food)
                    foodNames.append(foodData[n].F3)
                    foodCount += 1
                }
        }
        
        if !foodNames.contains(foodData[n].F4) && foodData[n].F4.hasPrefix(searchText.uppercased()) && foodData[n].F4 != ""{
            var food: Food = Food(id: foodCount, foodName: foodData[n].F4, isLiked: false, isDisliked: false)
                food.addDatesToFood()
                if food.serveDates.count != 0 {
                    foods.append(food)
                    foodNames.append(foodData[n].F4)
                    foodCount += 1
                }
        }
    }
    return foods
}

public struct FoodSearchView: View {
    @State private var searchText = ""
    public var body: some View {
        VStack {
            TextField("Search for a food.", text: $searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            FoodList(searchText: searchText)
        }
    }
}

struct FoodList: View {
    let searchText:String
    var body: some View {
            List {
                ForEach(convertDailyFoodsToFood(searchText: searchText)) { food in
                    FoodRow(food:food)
                }.padding(.init(top:0, leading:0, bottom: 15, trailing:0))
            }
    }
}

// TO DO: Add image if food is disliked or liked.
// TO DO: Find images for liked and disliked.

struct FoodRow: View {
    var food:Food
    var body: some View {
      //  NavigationLink(destination: FoodDetailView(food: food)) {
            Text(food.foodName)
      //  }
    }
}

struct FoodInformationView_Previews: PreviewProvider {
    static var previews: some View {
        FoodSearchView()
    }
}

extension Food {
    mutating func addDatesToFood() {
        var foodCount: Int = 0
        
        for n in 0...foodData.count - 1 {
            if self.foodName == foodData[n].F1 ||
            self.foodName == foodData[n].F2 ||
            self.foodName == foodData[n].F3 ||
            self.foodName == foodData[n].F4 {
                
                if !foodData[n].Date.contains("Cumartesi") {
                    if foodData[n].Date.contains("Pazartesi") {
                        self.serveDates.append(DateId(id: foodCount, date: foodData[n].Date))
                        foodCount += 1
                    }
                    else if foodData[n].Date.contains("Pazar") {
                        self.serveDates.append(DateId(id: foodCount, date: foodData[n].Date))
                        foodCount += 1
                    }
                }
            }
        }
    }
}
 

//
//  FoodDetailView.swift
//  Vestel_Food_Project - First_Version
//
//  Created by Arda Onat on 21.11.2019.
//  Copyright © 2019 Vestel V. All rights reserved.
//

import SwiftUI

struct FoodDetailView: View {
    var food: Food
    var body: some View {
        LikeDislikeButtons(food: food)
    }
}

struct LikeDislikeButtons: View {
    @EnvironmentObject var userData: UserData
    var food: Food
    
    // TO DO : Nil check for likes array and dislikes array.
    @State private var likesArray = UserDefaults.standard.array(forKey: "likes_array") as? [String] ?? [""]
    @State private var dislikesArray = UserDefaults.standard.array(forKey: "dislikes_array") as? [String] ?? [""]
    
    var foodIndex: Int {
        userData.foodArray.firstIndex(where: {$0.id == food.id})!
    }
    
    var body: some View {
        return
            VStack() {
                    Text(food.foodName).font(.largeTitle)
                   
                    List {
                        ForEach(food.serveDates) { date in
                                DateRow(date: date)
                        }.padding(.init(top:0, leading:0, bottom: 15, trailing:0))
                    }.frame(height: 400)
                    
                    HStack() {
                        Button(action: {
                            if !self.dislikesArray.contains(self.food.foodName) {
                                self.dislikesArray.append(self.food.foodName)
                                UserDefaults.standard.set(self.dislikesArray, forKey: "dislikes_array")
                                self.userData.dislikes = self.dislikesArray
                            }
                        }) {
                        Image("dislike").renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
                        }
                
                        Button(action: {
                            if !self.likesArray.contains(self.food.foodName){
                                self.likesArray.append(self.food.foodName)
                                UserDefaults.standard.set(self.likesArray, forKey: "likes_array")
                                self.userData.likes = self.likesArray
                            }
                        }) {
                        Image("like").renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
                        }
                        
                    }.offset(y:0)
            }
        }
}

struct DateRow: View {
    let date: DateId
    var body: some View {
        return Text(date.date)
    }
}

struct FoodDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let food = Food(id:0,foodName: "Template Food",serveDates: [DateId(id: 0, date: "Date1")], isLiked: false, isDisliked: false)
        return
            FoodDetailView(food:food)
                .environmentObject(UserData())
    }
}

func isKeyPresentInUserDefaults(key: String) -> Bool {
    return UserDefaults.standard.object(forKey: key) != nil
}

extension Day {
    func increaseDayScore() -> Day {
        var copy = self
        copy.foodScore += 2
        return copy
    }
    
    func decreaseDayScore() -> Day {
        var copy = self
        copy.foodScore -= 2
        return copy
    }
}


struct IfLet<T, Out: View>: View {
  let value: T?
  let produce: (T) -> Out

  init(_ value: T?, produce: @escaping (T) -> Out) {
    self.value = value
    self.produce = produce
  }

  var body: some View {
    Group {
      if value != nil {
        produce(value!)
      }
    }
  }
}

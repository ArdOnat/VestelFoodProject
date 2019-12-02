//
//  UserData.swift
//  VestelFoodProject
//
//  Created by Arda Onat on 1.12.2019.
//  Copyright © 2019 Arda Onat. All rights reserved.
//

import Foundation

final class UserData: ObservableObject {
    @Published var showLikesOnly = false
    @Published var showDislikesOnly = false
    @Published var dayArray = dayData
    @Published var foodArray = foodData
    @Published var likes = [String]()
    @Published var dislikes = [String]()
}

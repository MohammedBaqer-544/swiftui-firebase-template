//
//  PostModel1.swift
//  FirebaseTemplate
//
//  Created by Mohammed on 1/15/21.
//  Copyright © 2021 MohammedBaqer. All rights reserved.
//


import SwiftUI

struct PostModel : Identifiable {
    
    var id: String
    var title : String
    var pic: String
    var time : Date
    var user: UserModel
}

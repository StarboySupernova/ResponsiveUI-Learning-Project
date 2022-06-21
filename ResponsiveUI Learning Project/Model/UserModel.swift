//
//  UserModel.swift
//  ResponsiveUI Learning Project
//
//  Created by Simbarashe Dombodzvuku on 6/21/22.
//

import Foundation

struct User: Identifiable {
    var id = UUID().uuidString
    var name: String
    var image: String
    var title: String
}

var users: [User] = [
    User(name: "Strawberry Fields", image: "profile", title: "Quantum of Solace"),
    User(name: "Naomie Harris", image: "profile", title: "SkyFall"),
    User(name: "Monica Bellucci", image: "profile", title: "Spectre"),
    User(name: "Lea Seydoux", image: "profile", title: "No Time To Die"),
    User(name: "Eva Green", image: "profile", title: "Casino Royale"),
]

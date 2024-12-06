//
//  CardsModel.swift
//  Trail Blaze
//
//  Created by Udani Fernando on 03/12/2024.
//

import Foundation

struct Card: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let imageName : String
}

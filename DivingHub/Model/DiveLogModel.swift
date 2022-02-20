//
//  AppTextModel.swift
//  practiece
//
//  Created by Anupat Insuvanno on 18/2/2565 BE.
//

import Foundation
struct DiveLogModel:Decodable {
    var card:Strapi.Components.Card?
    func toUIModel()->String{
        return "Dive log with tags : "+["1","2"].joined(separator: "/");
    }
    func toUIModel()->Card.Diggy.Model{
        return Card.Diggy.Model(tag: nil, title: card?.title ?? "Empty Title", image: nil, backgroundHexColor: nil, rating: nil, attributes: []);
    }
}

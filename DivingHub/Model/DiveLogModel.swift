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
    func toUIModel()->DiggyCardModel{
        return DiggyCardModel(
            id:self.card?.title ?? "any",
            rating: 4,
            tag: self.card?.title,
            title: self.card?.title,
            image:nil,
            video: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
            backgroundHexColor: nil,
            attributes: ["24-28m.","85-90mins"]
        );
    }
}

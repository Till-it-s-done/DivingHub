//
//  AppTextModel.swift
//  practiece
//
//  Created by Anupat Insuvanno on 18/2/2565 BE.
//

import Foundation
struct DiveSpotModel:Decodable {
    var card:Strapi.Components.Card?
    func toUIModel()->String{
        return "Dive log with tags : "+["1","2"].joined(separator: "/");
    }
    func toUIModel()->BasicTaggio.Model{
        return BasicTaggio.Model(
            rating: self.card?.rating, people: 300, peopleSuffix: "instructors", tag: "Manta ray", title: "Kohtao Diving", image: "12123", video: <#T##String?#>, backgroundHexColor: <#T##String?#>, attributes: <#T##[String]?#>, subAttributes: <#T##[String]?#>, avatarImageSrc: <#T##String?#>, avatarBackgroundColor: <#T##String?#>
        );
    }
}

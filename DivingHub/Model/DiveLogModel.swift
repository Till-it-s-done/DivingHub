//
//  AppTextModel.swift
//  practiece
//
//  Created by Anupat Insuvanno on 18/2/2565 BE.
//

import Foundation
struct DiveLogModel:Decodable {
    var tags:[String];
    func toUIModel()->String{
        return "Dive log with tags : "+tags.joined(separator: "/");
    }
    func toUIModel()->Card.Diggy.Model{
        return Card.Diggy.Model();
    }
}

//
//  Strapi.swift
//  DivingHub
//
//  Created by Anupat Insuvanno on 20/2/2565 BE.
//

import Foundation
enum Strapi{
    struct Item<ItemModel:Decodable>:Decodable{
        var id:Int;
        var attributes:ItemModel;
    }
    struct Pagination:Decodable{
        var page:Int;
        var pageSize:Int;
        var pageCount:Int;
        var total:Int;
    }
    struct Meta:Decodable{
        var pagination:Pagination
    }

    struct Results<ItemModel:Decodable>:Decodable{
        var data:[Item<ItemModel>];
        var meta:Meta;
    }
    
    enum Components{
        struct Card:Decodable{
            var title:String?
            var rating:Int?
        }
    }
}

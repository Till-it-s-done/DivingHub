

//
//  File.swift
//  practiece
//
//  Created by Anupat Insuvanno on 18/2/2565 BE.
//

import  Combine;
import Foundation;

struct DiveSpotFetchParamsModel {
    
}

protocol DiveSpotRepository{
    func fetchData(params:DiveSpotFetchParamsModel) async throws->Strapi.Results<DiveSpotModel>
}


struct DiveSpotRepositoryNetwork:DiveSpotRepository {
    func fetchData(params: DiveSpotFetchParamsModel) async throws -> Strapi.Results<DiveSpotModel> {
        if(Environment.current.mockup){
            return Strapi.Results(data: [
                Strapi.Item(id: 1, attributes: DiveSpotModel(card: .init(title: "DiveSpot1", rating: 5)))
                
            ], meta:Strapi.Meta(pagination: Strapi.Pagination(page: 1, pageSize: 25, pageCount: 1, total: 4)))
        }
        return try await DataFetchingRequest<Strapi.Results<DiveSpotModel>>().get(url: "\(Environment.current.baseUrl)/Divespot") ?? Strapi.Results(data: [], meta:Strapi.Meta(pagination: Strapi.Pagination(page: 0, pageSize: 0, pageCount: 0, total: 0)))
    }    
}



//
//{
//    "data": [
//        {
//            "id": 1,
//            "attributes": {
//                "activity": "Scubar",
//                "createdAt": "2022-02-20T11:43:05.567Z",
//                "updatedAt": "2022-02-20T12:00:15.632Z",
//                "locale": "en",
//                "card": {
//                    "id": 1,
//                    "title": "DiveLogTitle",
//                    "rating": 5
//                },
//                "timeMins": [
//                    {
//                        "id": 1,
//                        "backgroundHex": null,
//                        "numberValue": 85,
//                        "stringValue": null
//                    },
//                    {
//                        "id": 2,
//                        "backgroundHex": null,
//                        "numberValue": 86,
//                        "stringValue": null
//                    },
//                    {
//                        "id": 3,
//                        "backgroundHex": null,
//                        "numberValue": 90,
//                        "stringValue": null
//                    }
//                ],
//                "rounds": [
//                    {
//                        "id": 4,
//                        "backgroundHex": null,
//                        "numberValue": 2,
//                        "stringValue": null
//                    },
//                    {
//                        "id": 5,
//                        "backgroundHex": null,
//                        "numberValue": 3,
//                        "stringValue": null
//                    }
//                ],
//                "depths": [
//                    {
//                        "id": 6,
//                        "backgroundHex": null,
//                        "numberValue": 30,
//                        "stringValue": null
//                    },
//                    {
//                        "id": 7,
//                        "backgroundHex": null,
//                        "numberValue": 45,
//                        "stringValue": null
//                    }
//                ],
//                "localizations": {
//                    "data": []
//                }
//            }
//        }
//    ],
//    "meta": {
//        "pagination": {
//            "page": 1,
//            "pageSize": 25,
//            "pageCount": 1,
//            "total": 1
//        }
//    }
//}

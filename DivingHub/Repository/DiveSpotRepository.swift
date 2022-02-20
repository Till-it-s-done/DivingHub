

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
    func fetchData(params:DiveSpotFetchParamsModel) async throws->[DiveSpotModel]
}


struct DiveSpotRepositoryNetwork:DiveSpotRepository {
    func fetchData(params: DiveSpotFetchParamsModel) async throws -> [DiveSpotModel] {
        return try await DataFetchingRequest<[DiveSpotModel]>().get(url: "\(Environment.current.baseUrl)/Divespot") ?? []
    }    
}


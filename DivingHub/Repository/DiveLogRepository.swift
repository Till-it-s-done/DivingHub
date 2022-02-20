

//
//  File.swift
//  practiece
//
//  Created by Anupat Insuvanno on 18/2/2565 BE.
//
import  Combine;

struct DiveLogFetchParamsModel {
    
}

protocol DiveLogRepository{
    func fetchData(params:DiveLogFetchParamsModel) async throws->[DiveLogModel]
}

struct DiveLogRepositoryNetwork:DiveLogRepository {
    func fetchData(params: DiveLogFetchParamsModel) async throws -> [DiveLogModel] {
        return try await DataFetchingRequest<[DiveLogModel]>().get(url: "\(Environment.current.baseUrl)/DiveLog") ?? []
    }
}


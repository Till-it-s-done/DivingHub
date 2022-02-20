

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
    func fetchData(params:DiveLogFetchParamsModel) async throws->Strapi.Results<DiveLogModel>
}

struct DiveLogRepositoryNetwork:DiveLogRepository {
    func fetchData(params: DiveLogFetchParamsModel) async throws -> Strapi.Results<DiveLogModel> {
        return try await DataFetchingRequest<Strapi.Results<DiveLogModel>>().get(url: "\(Environment.current.baseUrl)/dive-logs",param: ["populate":"*"]) ?? Strapi.Results(data: [], meta:Strapi.Meta(pagination: Strapi.Pagination(page: 0, pageSize: 0, pageCount: 0, total: 0)))
    }
}


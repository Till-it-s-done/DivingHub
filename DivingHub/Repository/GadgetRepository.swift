

//
//  File.swift
//  practiece
//
//  Created by Anupat Insuvanno on 18/2/2565 BE.
//
import  Combine;

struct GadgetFetchParamsModel {
    
}

protocol GadgetRepository{
    func fetchData(params:GadgetFetchParamsModel) async throws->[GadgetModel]
}

struct GadgetRepositoryNetwork:GadgetRepository {
    func fetchData(params: GadgetFetchParamsModel) async throws -> [GadgetModel] {
        return try await DataFetchingRequest<[GadgetModel]>().get(url: "\(Environment.current.baseUrl)/Gadget") ?? []
    }
}

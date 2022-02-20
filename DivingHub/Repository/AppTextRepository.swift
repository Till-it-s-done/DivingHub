

//
//  File.swift
//  practiece
//
//  Created by Anupat Insuvanno on 18/2/2565 BE.
//
import  Combine;
import Foundation

protocol AppTextRepository{
    func fetchData() async throws->AppTextModel
}

struct AppTextRepositoryyNetwork:AppTextRepository {
    func fetchData() async throws -> AppTextModel {
        guard let text = try await DataFetchingRequest<AppTextModel>().get(url: "\(Environment.current.baseUrl)/AppText") else {
            throw URLError(.resourceUnavailable)
        };
        return text
    }
}

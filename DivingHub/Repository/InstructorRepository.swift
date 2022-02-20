

//
//  File.swift
//  practiece
//
//  Created by Anupat Insuvanno on 18/2/2565 BE.
//
import  Combine;

struct InstructorFetchParamsModel {
    
}

protocol InstructorRepository{
    func fetchData(params:InstructorFetchParamsModel) async throws->[InstructorModel]
}

struct InstructorRepositoryNetwork:InstructorRepository {
    func fetchData(params: InstructorFetchParamsModel) async throws -> [InstructorModel] {
        return try await DataFetchingRequest<[InstructorModel]>().get(url: "\(Environment.current.baseUrl)/Instructor") ?? []
    }
}

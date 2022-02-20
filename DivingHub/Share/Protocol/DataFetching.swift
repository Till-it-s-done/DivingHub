//
//  DataFetchStateModel.swift
//  practiece
//
//  Created by Anupat Insuvanno on 19/2/2565 BE.
//

import Foundation

enum DataFetchingState {
    case notLoaded
    case loading
    case loaded
    case failed
    var isDone: Bool {
        switch self {
            case .loaded:
                return true;
            case .loading:
                return true;
            default:
                return false;
        }
   }
    var description : String {
        switch self {
        case .notLoaded:
                return "notLoaded";
        case .loading:
                return "loading";
        case .loaded:
            return "loaded";
        case .failed:
            return "failed";
        }
      }
}
struct DataFetchingModel<Model>{
    var state:DataFetchingState = .notLoaded
    var lastData:Model?
}


struct DataFetchingInteractor<Model>{
    var presenter:DataFetchingPresenter<Model>;
    var fetchData:() async throws ->Model
     func load()->DataFetchingInteractor<Model>{
        Task{
            do{
                presenter.loading()
                presenter.success(model: try await fetchData())
            }catch{
                presenter.error()
            }
            presenter.done()
            
        }
        return self;
    }
}

struct DataFetchingPresenter<Model>{
    var update:(DataFetchingState,Model?) ->Void;
    func loading(){
        DispatchQueue.main.async {
            update(.loading,nil)
        }
    }
    func done(){
        
    }
    func error(){
        DispatchQueue.main.async {
            update(.failed,nil)
        }
    }
    func success(model:Model){
        DispatchQueue.main.async {

        update(.loaded,model)
        }
    }
}



@available(iOS, deprecated: 15.0, message: "Use the built-in API instead")
    extension URLSession {
        func data(from url: URL) async throws -> (Data, URLResponse) {
         try await withCheckedThrowingContinuation { continuation in
            let task = self.dataTask(with: url) { data, response, error in
                 guard let data = data, let response = response else {
                     let error = error ?? URLError(.badServerResponse)
                     return continuation.resume(throwing: error)
                 }

                 continuation.resume(returning: (data, response))
             }

             task.resume()
        }
    }
}


struct DataFetchingRequest<ResponseModel:Decodable>{
    private func _get( url:String) async throws -> ResponseModel? {
        guard let url = URL(string: url) else {
            throw URLError(.badURL)
        }
        let urlRequest = URLRequest(url: url)
        if #available(iOS 15.0, *) {
            let (data, _) = try await URLSession.shared.data(for: urlRequest)
            let decoder = JSONDecoder()
            return try decoder.decode(ResponseModel?.self, from: data)
        } else {
            // Fallback on earlier versions
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            return try decoder.decode(ResponseModel?.self, from: data)
        }
    }
    func get( url:String) async throws -> ResponseModel? {
        return try await self._get(url: url)
    }
    func get( url:String,param:AnyObject?) async throws -> ResponseModel? {
        return try await self._get(url: url)
    }
}

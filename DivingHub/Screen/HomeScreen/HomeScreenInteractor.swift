//
//  HomeScreenInteractor.swift
//  practiece
//
//  Created by Anupat Insuvanno on 18/2/2565 BE.
//

import Foundation
protocol HomeScreenInteractorLogic:AnyObject{
    var   presenter:HomeScreenPresenterLogic {get set}
    var   staticText:DataFetchingInteractor<AppTextModel>? {get set};
    var   staticTextRepo:AppTextRepository {get };
    
    var   diveLogs:DataFetchingInteractor<[DiveLogModel]>? {get set};
    var   diveLogRepo:DiveLogRepository {get };
    
    var   gadgets:DataFetchingInteractor<[GadgetModel]>? {get set};
    var   gadgetRepo:GadgetRepository {get };
    
    var   instructors:DataFetchingInteractor<[InstructorModel]>? {get set};
    var   instructorRepo:InstructorRepository {get };
    
    var   diveSpots:DataFetchingInteractor<[DiveSpotModel]>? {get set};
    var   diveSpotRepo:DiveSpotRepository {get };
    
}
extension HomeScreenInteractorLogic{
    func afterRender() {
        Task {
            staticText = DataFetchingInteractor(presenter: presenter.staticText!,fetchData:staticTextRepo.fetchData).load();
            
            diveLogs = DataFetchingInteractor(presenter: presenter.diveLogs!,fetchData: {
                return try await self.diveLogRepo.fetchData(params: DiveLogFetchParamsModel())
            }).load();
            
            gadgets = DataFetchingInteractor(presenter: presenter.gadgets!,fetchData:{
                return try await self.gadgetRepo.fetchData(params: GadgetFetchParamsModel())
            }).load();
            
            instructors = DataFetchingInteractor(presenter: presenter.instructors!,fetchData:{
                return try await self.instructorRepo.fetchData(params: InstructorFetchParamsModel())
            }).load();
            
            diveSpots = DataFetchingInteractor(presenter: presenter.diveSpots!,fetchData:{
                return try await self.diveSpotRepo.fetchData(params: DiveSpotFetchParamsModel())
            }).load();
            
        }
    }
}

class HomeScreenInteractor:HomeScreenInteractorLogic{
    
    var presenter: HomeScreenPresenterLogic
    
    var staticText: DataFetchingInteractor<AppTextModel>?
    
    var staticTextRepo: AppTextRepository
    
    var diveLogs: DataFetchingInteractor<[DiveLogModel]>?
    
    var diveLogRepo: DiveLogRepository
    
    var gadgets: DataFetchingInteractor<[GadgetModel]>?
    
    var gadgetRepo: GadgetRepository
    
    var instructors: DataFetchingInteractor<[InstructorModel]>?
    
    var instructorRepo: InstructorRepository
    
    var diveSpots: DataFetchingInteractor<[DiveSpotModel]>?
    

    
    
    var diveSpotRepo: DiveSpotRepository
    init(presenter: HomeScreenPresenterLogic,
         staticTextRepo: AppTextRepository,
         diveLogRepo: DiveLogRepository,
         gadgetRepo: GadgetRepository,
         instructorRepo: InstructorRepository,
         diveSpotRepo:DiveSpotRepository) {
        
        self.presenter=presenter
        
        self.staticTextRepo=staticTextRepo
        
        self.diveLogRepo=diveLogRepo
        
        self.gadgetRepo=gadgetRepo
        
        self.instructorRepo=instructorRepo
        
        self.diveSpotRepo=diveSpotRepo
                
    }
}

//
//  HomeScreenPresenter.swift
//  practiece
//
//  Created by Anupat Insuvanno on 18/2/2565 BE.
//
import Foundation

protocol HomeScreenPresenterLogic:AnyObject {
    var view:HomeScreenViewState? {get set};
    var staticText:DataFetchingPresenter<AppTextModel>? {get set};
    var diveLogs:DataFetchingPresenter<Strapi.Results<DiveLogModel>>? {get set};
    var diveSpots:DataFetchingPresenter<[DiveSpotModel]>? {get set};
    var gadgets:DataFetchingPresenter<[GadgetModel]>? {get set};
    var instructors:DataFetchingPresenter<[InstructorModel]>? {get set};
    func setup()
}

extension HomeScreenPresenterLogic{
    func setup(){
        
        self.staticText = DataFetchingPresenter(update:{state,data in
            if(data != nil){
                self.view!.staticText.lastData = data
            }
            self.view!.staticText.state = state;
        })
        self.diveLogs = DataFetchingPresenter(update:{state,data in
            if(data != nil){
                self.view!.diveLogs.lastData = data!.data.map({ model in
                    return model.attributes.toUIModel();
                })
            }
            self.view!.diveLogs.state = state;
        })
        self.diveSpots = DataFetchingPresenter(update:{state,data in
            if(data != nil){
                self.view!.diveSpots.lastData = data!.map({ model in
                    return model.toUIModel();
                })
            }
            self.view!.diveSpots.state = state;
        })
        self.gadgets = DataFetchingPresenter(update:{state,data in
            if(data != nil){
                self.view!.gadgets.lastData = data!.map({ model in
                    return model.toUIModel();
                })
            }
            self.view!.gadgets.state = state;
        })
        self.instructors = DataFetchingPresenter(update:{state,data in
            if(data != nil){
                self.view!.instructors.lastData = data!.map({ model in
                    return model.toUIModel();
                })
            }
            self.view!.instructors.state = state;
        })
    }
}


final class HomeScreenPresenter:HomeScreenPresenterLogic{
    var view: HomeScreenViewState?
    
    var staticText: DataFetchingPresenter<AppTextModel>?
    
    var diveLogs: DataFetchingPresenter<Strapi.Results<DiveLogModel>>?
    
    var diveSpots: DataFetchingPresenter<[DiveSpotModel]>?
    
    var gadgets: DataFetchingPresenter<[GadgetModel]>?
    
    var instructors: DataFetchingPresenter<[InstructorModel]>?
    

    init(){
        self.setup();
    }
}

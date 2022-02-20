//
//  HomeScreenViewModel.swift
//  practiece
//
//  Created by Anupat Insuvanno on 19/2/2565 BE.
//

import Foundation


class HomeScreenViewState:ObservableObject {
    @Published var staticText:DataFetchingModel<AppTextModel> = DataFetchingModel();
    @Published var diveLogs:DataFetchingModel<[Card.Diggy.Model]> = DataFetchingModel();
    @Published var gadgets:DataFetchingModel<[Card.CompactPriceDolly.Model]> = DataFetchingModel();
    @Published var instructors:DataFetchingModel<[Card.ProfileRatingDeelo.Model]> = DataFetchingModel();
    @Published var diveSpots:DataFetchingModel<[Card.BasicTagglo.Model]> = DataFetchingModel();
    
}

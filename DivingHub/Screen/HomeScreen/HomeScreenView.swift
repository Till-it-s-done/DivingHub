//
//  HomeScreenInteractor.swift
//  DivingHub
//
//  Created by Anupat Insuvanno on 18/2/2565 BE.
//

import Foundation
import SwiftUI

struct HomeScreenView: View {
    @ObservedObject var vm: HomeScreenViewState

    var interactor:HomeScreenInteractorLogic;
    init(interactor:HomeScreenInteractorLogic)  {
        self.interactor=interactor;
        vm = HomeScreenViewState(
        
        )
        self.interactor.presenter.view = vm;
    }
    var body: some View {
        HStack{
            Text(vm.diveLogs.lastData?.first?.title ?? "None")
                .padding()
        }.onAppear(perform:{
            self.interactor.afterRender()
        })
    }
    
}

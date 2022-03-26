//
//  ContentView.swift
//  DivingHub
//
//  Created by Anupat Insuvanno on 20/2/2565 BE.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HomeScreenViewWrapper(interactor: HomeScreenInteractor(presenter: HomeScreenPresenter(), staticTextRepo: AppTextRepositoryyNetwork(), diveLogRepo: DiveLogRepositoryNetwork(), gadgetRepo: GadgetRepositoryNetwork(), instructorRepo: InstructorRepositoryNetwork(), diveSpotRepo: DiveSpotRepositoryNetwork())).edgesIgnoringSafeArea([.top,.bottom])
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

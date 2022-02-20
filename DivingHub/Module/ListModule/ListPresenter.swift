//
//  ListPresenter.swift
//  practiece
//
//  Created by Anupat Insuvanno on 13/2/2565 BE.
//

import Foundation


class ListPresenter: ObservableObject{
    @Published public var username = "test";
    

    func updateState() {
        username+="t";
    }
}

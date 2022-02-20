//
//  Environment.swift
//  DivingHub
//
//  Created by Anupat Insuvanno on 20/2/2565 BE.
//

import Foundation


struct Environment {
    let baseUrl: String
}

extension Environment {
    #if STAGING
        static let current = Environment(
             baseUrl: "http://localhost:3000/api"
        )
    #else
        static let current = Environment(
             baseUrl: "http://localhost:3000/api"
            
        )
    #endif
}


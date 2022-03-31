//
//  Environment.swift
//  DivingHub
//
//  Created by Anupat Insuvanno on 20/2/2565 BE.
//

import Foundation


struct Environment {
    let baseUrl: String
    let mockup:Bool
}

extension Environment {
    #if STAGING
        static let current = Environment(
             baseUrl: "http://localhost:3000/api",
             mockup:true
        )
    #else
        static let current = Environment(
            baseUrl: "http://localhost:1337/api",
            mockup:true
            
        )
    #endif
}


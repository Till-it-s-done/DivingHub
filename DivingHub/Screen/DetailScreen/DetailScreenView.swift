//
//  DetailScreenView.swift
//  DivingHub
//
//  Created by Anupat Insuvanno on 30/3/2565 BE.
//

import Foundation
import UIKit

class DetailScreenView:UIViewController{
    
    init(id:String)  {
        super.init(nibName: nil, bundle: nil)
        self.view.backgroundColor = ThemeManager.getTheme().bgColor
        let lb = UILabel.text_0_85x_normal(id+"1212343434344334343434")
        self.view.addSubview(lb)
        lb.sizeToFit()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        

        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

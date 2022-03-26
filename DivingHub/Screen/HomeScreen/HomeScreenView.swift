//
//  HomeScreenInteractor.swift
//  DivingHub
//
//  Created by Anupat Insuvanno on 18/2/2565 BE.
//

import Foundation
import SwiftUI
import UIKit
import Combine




class HomeScreenViewController: UIViewController {
    var vm: HomeScreenViewState;
    var interactor:HomeScreenInteractorLogic;
    var label:UILabel!

    private var subscriptions = Set<AnyCancellable>()
    init(interactor:HomeScreenInteractorLogic)  {
        self.interactor=interactor;
        vm = HomeScreenViewState(
        
        )
        self.interactor.presenter.view = vm;
        super.init(nibName: nil, bundle: nil)
    }
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        // create the alert
         let alert = UIAlertController(title: "UIAlertController", message: "Would you like to continue learning how to use iOS alerts?", preferredStyle: UIAlertController.Style.alert)

         // add the actions (buttons)
         alert.addAction(UIAlertAction(title: "Continue", style: UIAlertAction.Style.default, handler: nil))
         alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))

         // show the alert
         self.present(alert, animated: true, completion: nil)
            
    }
    override func viewDidLoad() {
        label = UILabel()
        label.text = ""
//        let v = DiggyCardView(model: DiggyCardModel(rating: nil, tag: nil, title: "Test", image: nil, video: nil, backgroundHexColor: nil, attributes: nil))
//        v.translatesAutoresizingMaskIntoConstraints = false
//        self.view.addSubview(v)
//        v.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true;
//        v.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true;
        
        let recog = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
    
   // function which is triggered when handleTap is called
   
        
        
        
        self.interactor.afterRender()
        self.vm.$diveLogs.receive(on: DispatchQueue.main).sink{
            data in
            print("self.vm.$diveLogs.sink>>:"+(data.lastData?.first?.title ?? ""))
            self.label.text = data.lastData?.first?.title
            self.label.sizeToFit()
            
        }.store(in:&subscriptions)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}


struct HomeScreenViewWrapper: UIViewControllerRepresentable {
    var interactor:HomeScreenInteractorLogic;

    func makeUIViewController(context: Context) -> HomeScreenViewController {
        return HomeScreenViewController(interactor:interactor)
    }

    func updateUIViewController(_ viewController: HomeScreenViewController,
                                context: Context) {
        // Nothing to do here, since our view controller is
        // read-only from the outside.
    }
}

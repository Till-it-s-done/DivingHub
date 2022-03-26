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
    
    
    private var subscriptions = Set<AnyCancellable>()
    init(interactor:HomeScreenInteractorLogic)  {
        self.interactor=interactor;
        vm = HomeScreenViewState(
            
        )
        self.interactor.presenter.view = vm;
        super.init(nibName: nil, bundle: nil)
    }
    
    private lazy var collectionView:UIView = {
        let v = PageBuilderView(
            sections: [
                section_title,
                section_features
            ]
        );
        v.translatesAutoresizingMaskIntoConstraints  = false;
        v.backgroundColor  = ThemeManager.getTheme().bgColor
        
        return v;
    }()
    
    override func viewDidLoad() {
        self.interactor.afterRender()
        self.vm.$diveLogs.receive(on: DispatchQueue.main).sink{
            data in
            print("self.vm.$diveLogs.sink>>:"+(data.lastData?.first?.title ?? ""))
            
        }.store(in:&subscriptions)
        
        self.view.addSubview(collectionView)
        collectionView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1).isActive=true
        collectionView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1).isActive=true
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private lazy var section_title:PageSectionInput = {
        return PageSectionInput(section:
            PageSection(sectionType: .verticalAutoHeight, sectionHeaderType: .none, key: "section_title_s"), items: [
                PageItem(loading: false, key: "section_title_s_i1", itemBuilder: {
                    let stack = UIStackView()
                    let th = ThemeManager.getTheme()
                    let lb = UILabel.text_3_66x_normal("Thailand diving starts here").maxLine(maxLine: 2).align(.center)
                    stack.addArrangedSubview(lb)
                    stack.layoutMargins = UIEdgeInsets(top: th.space8*3, left: 0, bottom: th.space8*3, right: 0)
                    stack.isLayoutMarginsRelativeArrangement = true
                    return stack
                }),
            ]);
    }()
    
    private lazy var section_features:PageSectionInput = {
        return PageSectionInput(section:
        PageSection(sectionType: .verticalAutoHeight, sectionHeaderType: .none, key: "section_feature_s"), items: [
            PageItem(loading: false, key: "section_feature_f_i1", itemBuilder: {
                return FeatureCardView(model:FeatureCardModel(
                    title: "Dive Spot",
                    descrption: "Explore all dive spots\nin Thailand",
                    image:"https://upload.wikimedia.org/wikipedia/commons/4/47/PNG_transparency_demonstration_1.png?20210701224649",
                    
                    backgroundHexColor: UIColor.pastelPurpleStr(),
                    onTap: nil
                ))
            }),
            PageItem(loading: false, key: "section_feature_f_i2", itemBuilder: {
                return FeatureCardView(model:FeatureCardModel(
                    title: "Gadgets",
                    descrption: "You new snoggle\nand reg and more",
                    
                    image:"https://upload.wikimedia.org/wikipedia/commons/4/47/PNG_transparency_demonstration_1.png?20210701224649",
                    
                    backgroundHexColor: UIColor.pastelGreenStr(),
                    onTap: nil
                ))
            }),
            PageItem(loading: false, key: "section_feature_f_i3", itemBuilder: {
                return FeatureCardView(model:FeatureCardModel(
                    title: "Dive logs",
                    descrption: "Create and share\nyour dive history",
                    
                    image:"https://upload.wikimedia.org/wikipedia/commons/4/47/PNG_transparency_demonstration_1.png?20210701224649",
                    
                    backgroundHexColor: UIColor.pastelYellowStr(),
                    onTap: nil
                ))
            }),
            PageItem(loading: false, key: "section_feature_f_i4", itemBuilder: {
                return FeatureCardView(model:FeatureCardModel(
                    title: "Instructors",
                    descrption: "Create and share\nyour dive history",
                    
                    image:"https://upload.wikimedia.org/wikipedia/commons/4/47/PNG_transparency_demonstration_1.png?20210701224649",
                    
                    backgroundHexColor: UIColor.pastelPinkStr(),
                    onTap: nil
                ))
            }),
        ]);
    }()
    
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


struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenViewWrapper(interactor: HomeScreenInteractor(presenter: HomeScreenPresenter(), staticTextRepo: AppTextRepositoryyNetwork(), diveLogRepo: DiveLogRepositoryNetwork(), gadgetRepo: GadgetRepositoryNetwork(), instructorRepo: InstructorRepositoryNetwork(), diveSpotRepo: DiveSpotRepositoryNetwork())).edgesIgnoringSafeArea([.top,.bottom])
    }
}

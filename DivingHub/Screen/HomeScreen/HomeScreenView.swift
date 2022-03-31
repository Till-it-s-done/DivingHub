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



class MyPageBuilderView:PageBuilderView{
    override func c_registerCells(){
        DiggyCardCell.register(collectionView: collectionView)
        FeatureCardCell.register(collectionView: collectionView)
        ShimmerCell.register(collectionView: collectionView)
    }
    override func c_cell(collectionView: UICollectionView, indexPath: IndexPath, item: PageItem<Any>) -> UICollectionViewCell? {
        return (
            DiggyCardCell.cell(collectionView: collectionView, indexPath: indexPath, item: item) ??
            FeatureCardCell.cell(collectionView: collectionView, indexPath: indexPath, item: item) ??
            ShimmerCell.cell(collectionView: collectionView, indexPath: indexPath, item: item)
        )
    }
}


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
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.setNavigationBarHidden(true,animated: false)
    }
    @objc  func handleTapFeature(_ sender: MyTapGesture? = nil){
        
        self.navigationController?.setNavigationBarHidden(false,animated: false)
        self.navigationController?.pushViewController(DetailScreenView(id: (sender?.id ?? "Unknown")), animated: true);
    }
    
    func sections()->[PageSectionInput]{
        return [
            section_title,
            section_features,
            section_divespots(),
            section_instructors(),
            section_gadgets(),
            section_divelogs()
        ]
    }
    func refreshData(){
        collectionView.refreshData(newSections: sections())
    }
    
    private lazy var collectionView:MyPageBuilderView = {
        let v = MyPageBuilderView(
            sections: sections()
        );
        v.translatesAutoresizingMaskIntoConstraints  = false;
        v.backgroundColor  = ThemeManager.getTheme().bgColor
        
        return v;
    }()
    
    override func viewDidLoad() {
        
        self.interactor.afterRender()
        self.vm.$diveLogs.receive(on: DispatchQueue.main).sink{
            data in
                self.refreshData()
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
                                    PageSection(
                                        sectionType: .verticalAutoHeight,
                                        sectionHeaderType: .none,
                                        key: "section_title_s"),
                                items: [
                                    PageItem(loading: false, key: "section_title_s_i1",cell: BasicCell<Any>.reuseIdentifier, itemBuilder: {
                                            let stack = UIStackView()
                                            let th = ThemeManager.getTheme()
                                            let lb = UILabel.text_3_66x_normal("Thailand diving starts here").maxLine(maxLine: 2).align(.center)
                                            lb.translatesAutoresizingMaskIntoConstraints = false
                                            stack.addArrangedSubview(lb)                                            
                                            return stack.padding(paddingX: 0, paddingY: ThemeManager.getTheme().space8*3)
                                    }),
                                ]);
    }()
    
    
    private lazy var section_features:PageSectionInput = {
        return PageSectionInput(section:
        PageSection(sectionType: .verticalAutoHeight, sectionHeaderType: .none, key: "section_feature_s"), items: [
            PageItem(loading: false, key: "section_feature_f_i1",cell: FeatureCardCell.reuseIdentifier,data:FeatureCardModel(
                title: "Dive Spot",
                descrption: "Explore all dive spots\nin Thailand",
                image:"https://upload.wikimedia.org/wikipedia/commons/4/47/PNG_transparency_demonstration_1.png?20210701224649",
                
                backgroundHexColor: UIColor.pastelPurpleStr(),
                onTap: MyTapGesture(target: self, action: #selector(self.handleTapFeature(_:))).withId(dataId: "Dive Spot")
            )),
            PageItem(loading: false, key: "section_feature_f_i2",cell: FeatureCardCell.reuseIdentifier,data:FeatureCardModel(
                title: "Gadgets",
                descrption: "You new snoggle\nand reg and more",
                
                image:"https://upload.wikimedia.org/wikipedia/commons/4/47/PNG_transparency_demonstration_1.png?20210701224649",
                
                backgroundHexColor: UIColor.pastelGreenStr(),
                onTap: nil
            )),
            PageItem(loading: false, key: "section_feature_f_i3",cell: FeatureCardCell.reuseIdentifier,data:FeatureCardModel(
                title: "Dive logs",
                descrption: "Create and share\nyour dive history",
                
                image:"https://upload.wikimedia.org/wikipedia/commons/4/47/PNG_transparency_demonstration_1.png?20210701224649",
                
                backgroundHexColor: UIColor.pastelYellowStr(),
                onTap: nil
            )),
            PageItem(loading: false, key: "section_feature_f_i4",cell: FeatureCardCell.reuseIdentifier,data:FeatureCardModel(
                title: "Instructors",
                descrption: "Create and share\nyour dive history",
                
                image:"https://upload.wikimedia.org/wikipedia/commons/4/47/PNG_transparency_demonstration_1.png?20210701224649",
                
                backgroundHexColor: UIColor.pastelPinkStr(),
                onTap: nil
            )),
        ]);
    }()
    
    
    private func section_divespots()->PageSectionInput{
        return PageSectionInput(section:
                                    PageSection(sectionType: .horizontalScroll(cardsOnScreen: 1),
                                                sectionHeaderType: .title(
                                                    model:
                                                        SectionHeaderModel(title: "Top dive spots",
                                                                           actionMode: .arrow,
                                                                           onTap: nil)),
                                                key: "section_divespots"),
                                items: [
                                    PageItem(loading: false, key: "s1x1",cell:ShimmerCell.reuseIdentifier)
                                ]
        );
    }
    private func section_instructors()->PageSectionInput{
        return PageSectionInput(section:
                                    PageSection(sectionType: .horizontalScroll(cardsOnScreen: 1),
                                                sectionHeaderType: .title(
                                                    model:
                                                        SectionHeaderModel(title: "Best instructors",
                                                                           actionMode: .arrow,
                                                                           onTap: nil)),
                                                key: "section_instructors"),
                                items: [
                                    PageItem(loading: false, key: "1x1",cell:ShimmerCell.reuseIdentifier)
                                ]
        );
    }
    private func section_gadgets()->PageSectionInput{
        return PageSectionInput(section:
                                    PageSection(sectionType: .horizontalScroll(cardsOnScreen: 1),
                                                sectionHeaderType: .title(
                                                    model:
                                                        SectionHeaderModel(title: "Top Gadgets",
                                                                           actionMode: .arrow,
                                                                           onTap: nil)),
                                                key: "section_gadgets"),
                                items: [
                                    PageItem(loading: false, key: "y1",cell:ShimmerCell.reuseIdentifier)
                                ]
        );
    }
    private func section_divelogs()->PageSectionInput{
        var items:[PageItem<Any>] = []
        if(self.vm.diveLogs.state == .loaded && self.vm.diveLogs.lastData != nil && !self.vm.diveLogs.lastData!.isEmpty){
            items = (self.vm.diveLogs.lastData ?? []).map({ model in
                PageItem(loading: false, key: (model as DiggyCardModel).id,cell:DiggyCardCell.reuseIdentifier,data: model)
            })
        }else{
            items = [
                PageItem(loading: false, key: "z1",cell:ShimmerCell.reuseIdentifier)
            ]
            
        }
        return PageSectionInput(section:
                                    PageSection(
                                        
                                        
                                        sectionType: .horizontalScroll(cardsOnScreen: 1),
                                        sectionHeaderType: .title(
                                            model:
                                                SectionHeaderModel(title: "Your Divelogs",
                                                                   actionMode: .arrow,
                                                                   onTap: nil)),
                                        key: "section_divelogs"),
                                items: items
        );
        
        
    }
    
}


struct HomeScreenViewWrapper: UIViewControllerRepresentable {
    var interactor:HomeScreenInteractorLogic;
    let navController =  UINavigationController()

    func makeUIViewController(context: Context) -> UINavigationController {
        
        navController.addChild(HomeScreenViewController(interactor:interactor))

        return navController
    }
    
    func updateUIViewController(_ viewController: UINavigationController,
                                context: Context) {
        // Nothing to do here, since our view controller is
        // read-only from the outside.
    }
}


struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenViewWrapper(interactor: HomeScreenInteractor(presenter: HomeScreenPresenter(), staticTextRepo: AppTextRepositoryyNetwork(), diveLogRepo: DiveLogRepositoryNetwork(), gadgetRepo: GadgetRepositoryNetwork(), instructorRepo: InstructorRepositoryNetwork(), diveSpotRepo: DiveSpotRepositoryNetwork()))
    }
}

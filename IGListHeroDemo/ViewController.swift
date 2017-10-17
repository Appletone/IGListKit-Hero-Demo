//
//  ViewController.swift
//  IGListHeroDemo
//
//  Created by louis on 2017/10/16.
//  Copyright © 2017年 louis. All rights reserved.
//

import UIKit
import IGListKit
import Hero


class ViewController: UIViewController, ListAdapterDataSource {

 
    @IBOutlet weak var collectionView: UICollectionView!
    
    var cities = City.cities
    
    lazy var adapter: ListAdapter = {
        return ListAdapter(updater: ListAdapterUpdater(), viewController: self)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        adapter.collectionView = collectionView
        adapter.dataSource = self
        
//        HeroDebugPlugin.isEnabled = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: - ListAdapterDataSource
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return cities
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return CityListSectionController()
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}


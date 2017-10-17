//
//  CityListSectionController.swift
//  IGListHeroDemo
//
//  Created by louis on 2017/10/16.
//  Copyright © 2017年 louis. All rights reserved.
//

import UIKit
import IGListKit

class CityListSectionController: ListSectionController {
    private var object: City?
    
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width, height: 200)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCellFromStoryboard(withIdentifier: "CityCell",
                                                                              for: self,
                                                                              at: index) as? CityCell else {
                                                                                fatalError()
        }
        cell.city = self.object
        return cell
    }
    
    override func didUpdate(to object: Any) {
        self.object = object as? City
    }
    
    override func didSelectItem(at index: Int) {
        if let secVC = self.viewController?.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController {
            secVC.city = self.object
            self.viewController?.present(secVC, animated: true, completion: nil)
        }
    }
}

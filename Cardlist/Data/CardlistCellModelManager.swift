//
//  CardlistCellModelManager.swift
//  Cardlist
//
//  Created by m on 2020/6/6.
//  Copyright © 2020 m. All rights reserved.
//

import Foundation

public let modelMaps: [AnyClass] = [
    CardlistBaseModel.self,
    ImageCardModel.self,
    TitleCardModel.self
]


class CardlistCellModelManager: NSObject {
    public static let sharedManager = CardlistCellModelManager()
    
    private var dataMap = Dictionary<String, Any>()
    
    func setUpCellModelMap() {
        for clazz in modelMaps {
            guard let modelClass = clazz as? CardlistBaseModel.Type else {
                continue
            }
            bind(modelClass: modelClass, withCellClass: modelClass.associatedCell)
        }
    }
    
    @discardableResult
    func bind(modelClass: AnyClass, withCellClass cellClass: AnyClass) -> Bool {
        guard let cardModel = modelClass as? CardlistBaseModel.Type, let cardCell = cellClass as? CardlistBaseCell.Type else {
            return false
        }
        
        //key for model
        let cardType: String = String(cardModel.cardType.rawValue)
        
        if (dataMap.keys.contains(cardType)) {
            assert(false, "Duplicated card type registered")
            return false
        }
        dataMap[cardType] = cardModel
        
        //key for cell
        let cellKey = NSStringFromClass(cardModel)
        dataMap[cellKey] = cardCell
        return true
    }
    
    func cellClassFor(model: AnyClass) -> CardlistBaseCell.Type? {
        guard let modelClass = model as? CardlistBaseModel.Type else {
            return nil
        }
        //key for cell
        let cellKey = NSStringFromClass(modelClass)
        let cellClass = dataMap[cellKey] as? CardlistBaseCell.Type
        return cellClass
    }
    
    func cellClassFor(cardType: CardType) -> CardlistBaseCell.Type? {
        guard let model = dataMap[String(cardType.rawValue)] as? CardlistBaseModel.Type else {
            return nil
        }
        return cellClassFor(model: model)
    }
    
    func modelClassFor(cardType: CardType) -> CardlistBaseModel.Type? {
        let cardType: String = String(cardType.rawValue)
        return dataMap[cardType] as? CardlistBaseModel.Type
    }
}

//
//  CardlistBaseModel.swift
//  Cardlist
//
//  Created by m on 2020/6/3.
//  Copyright © 2020 m. All rights reserved.
//

import UIKit

protocol CardlistBaseModelCalculatedFrameProtocol {
    func frameWith(model:CardlistBaseModel) -> CGRect
}

public enum CardType: Int, Codable {
    case UndefinedType
    case TitleCard
    case ImageCard
}

public class CardlistBaseModel: Codable, CardlistBaseModelCalculatedFrameProtocol {
    
    public class var cardType: CardType {
        CardType.UndefinedType
    }
    public class var associatedCell: AnyClass {
        CardlistBaseCell.self
    }
    
    var title: String?
    var desc: String?
    
    enum CodingKeys: String, CodingKey {
        case title = "card_title"
        case desc = "card_desc"
    }
    
    func frameWith(model: CardlistBaseModel) -> CGRect {
        return CGRect.zero
    }
    
    var description: String {
        get {
            return """
            card_type: \(CardlistBaseModel.self.cardType)
            card_title: \(self.title ?? "")
            card_desc: \(self.desc ?? "")
            """
        }
    }
}

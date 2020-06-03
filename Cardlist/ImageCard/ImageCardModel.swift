//
//  ImageCard.swift
//  Cardlist
//
//  Created by m on 2020/6/5.
//  Copyright © 2020 m. All rights reserved.
//

import UIKit

public class ImageCardModel: CardlistBaseModel {
    
    public class override var cardType: CardType {
        CardType.ImageCard
    }
    public class override var associatedCell: AnyClass {
        CardlistImgCell.self
    }
    
    var imgURL: String?
    
    enum CodingKeys: String, CodingKey {
        case imgURL = "card_img_url"
    }
    
    override func frameWith(model: CardlistBaseModel) -> CGRect {
        return CGRect.zero
    }
}

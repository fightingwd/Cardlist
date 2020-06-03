//
//  TitleCard.swift
//  Cardlist
//
//  Created by m on 2020/6/13.
//  Copyright © 2020 m. All rights reserved.
//

import Foundation

class TitleCardModel: CardlistBaseModel {
    
    public class override var cardType: CardType {
        CardType.TitleCard
    }
    public class override var associatedCell: AnyClass {
        CardlistTitleCell.self
    }
}

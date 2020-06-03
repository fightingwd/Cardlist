//
//  CardlistBaseCell.swift
//  Cardlist
//
//  Created by m on 2020/6/4.
//  Copyright © 2020 m. All rights reserved.
//

import UIKit

class CardlistBaseCell: UITableViewCell {
    
    private(set) var cardModel: CardlistBaseModel
    
    private var infoLabel: UILabel
    
    required init(cardModel: CardlistBaseModel) {
        self.cardModel = cardModel
        self.infoLabel = UILabel(frame: CGRect.zero)
        super.init(style: CellStyle.default, reuseIdentifier: NSStringFromClass(type(of: self)))
        
        self.infoLabel.frame = self.bounds.insetBy(dx: 16, dy: 0)
        let thisType = type(of: self)
        self.infoLabel.text = String(describing: thisType)
        self.infoLabel.textColor = .black
        
        self.backgroundColor = .white
        self.addSubview(self.infoLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

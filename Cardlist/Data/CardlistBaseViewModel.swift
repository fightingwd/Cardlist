//
//  CardlistBaseViewModel.swift
//  Cardlist
//
//  Created by m on 2020/6/3.
//  Copyright © 2020 m. All rights reserved.
//

import UIKit

class CardlistBaseViewModel: NSObject {
    var data: [CardlistBaseModel]?
    
    func requsetData() {
        self.data = self._mockDatas()
    }
    
    func _mockDatas() -> [CardlistBaseModel] {
        let arr = [[
             "card_type": 0,
            "card_title": "this is a title",
             "card_desc": "this is a desc",
            ],     [
             "card_type": 1,
            "card_title": "this is a title 2",
             "card_desc": "this is a desc 2",
            ],     [
             "card_type": 2,
            "card_title": "this is a title 3",
             "card_desc": "this is a desc 3"
            ]]
        
        var result: [CardlistBaseModel] = [CardlistBaseModel]()
        for dict: Dictionary in arr {
            do {
                let data = try JSONSerialization.data(withJSONObject: dict, options: JSONSerialization.WritingOptions.fragmentsAllowed)
                let cardType: CardType = CardType(rawValue: dict["card_type"] as? Int ?? 0) ?? CardType.UndefinedType
                let modelClazz = CardlistCellModelManager.sharedManager.modelClassFor(cardType: cardType) ?? CardlistBaseModel.self
                let model = try JSONDecoder().decode(modelClazz, from:data)
                result.append(model)
            } catch {
                print(error)
            }
        }
        return result
    }
}

extension CardlistBaseViewModel: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}

extension CardlistBaseViewModel: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = (data?[indexPath.row] ?? CardlistBaseModel()) as CardlistBaseModel
        let cellClass: CardlistBaseCell.Type? = CardlistCellModelManager.sharedManager.cellClassFor(model: type(of: model))
        if cellClass == nil {
            let defaultCell = tableView.dequeueReusableCell(withIdentifier: "default_cell")
            return defaultCell ?? UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "default_cell")
        }
        let cell = cellClass!.init(cardModel: model)
        return cell
    }
    
    
}

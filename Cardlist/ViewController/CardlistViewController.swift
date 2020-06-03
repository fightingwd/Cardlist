//
//  CardlistViewController.swift
//  Cardlist
//
//  Created by m on 2020/6/3.
//  Copyright © 2020 m. All rights reserved.
//

import UIKit

class CardlistViewController: UITableViewController {
    
    private(set) lazy var viewModel: CardlistBaseViewModel = {
        return CardlistBaseViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .white
        
        CardlistCellModelManager.sharedManager.setUpCellModelMap()
        
        self.tableView.delegate = self.viewModel
        self.tableView.dataSource = self.viewModel
        self.viewModel.requsetData()
    }
    
    

}

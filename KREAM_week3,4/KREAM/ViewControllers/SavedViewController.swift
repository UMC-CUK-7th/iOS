//
//  SavedViewController.swift
//  KREAM
//
//  Created by 서재민 on 10/20/24.
//

import UIKit

class SavedViewController: UIViewController {
    
    //MARK: - Properties
    let savedView = SavedView()
    let data = DummySavedModel.Productdata
    //MARK: - LifeCycle
    
    override func loadView() {
        self.view = savedView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.SetUpTableView()
        
        // Do any additional setup after loading the view.
    }
    
    func SetUpTableView() {
        savedView.SavedTableView.separatorStyle = .none
        savedView.SavedTableView.delegate = self
        savedView.SavedTableView.dataSource = self
        
        registerCells()
        
    }
    private func registerCells() {
        savedView.SavedTableView.register(SavedCell.self, forCellReuseIdentifier: SavedCell.identifier)
    }
    
}
//MARK: - Delegate,DataSource Setup

extension SavedViewController:
    UITableViewDelegate{
    
    //delegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellHeight: CGFloat = 100
        return cellHeight
    }
}

extension SavedViewController:
        UITableViewDataSource{
    //datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == savedView.SavedTableView {
            let savedCell = tableView.dequeueReusableCell(withIdentifier: SavedCell.identifier, for: indexPath) as! SavedCell
            savedCell.configure (model: data[indexPath.row])
            
            return savedCell
        }
        return UITableViewCell()
    }
}


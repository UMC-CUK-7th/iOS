//
//  SavedViewController.swift
//  KREAM
//
//  Created by 류한비 on 10/20/24.
//

import UIKit

class SavedViewController: UIViewController {
    
    let data = dummySavedModel.saveDatas //데이터 받아옴
    
    private lazy var savedView: SavedView = {
        let view = SavedView()
        view.savedTableView.dataSource = self
        return view
    }()
    
    override func loadView() {
        self.view = savedView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

// MARK: - UITableView DataSource
extension SavedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count //cell을 data 개수만큼 테이블 뷰에 보이게 함
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SavedCell.identifier, for: indexPath) as? SavedCell else {
            return UITableViewCell()
        }
        cell.configure(model: data[indexPath.row])
        
        return cell
    }
}

// MARK: - UITableView Delegate
extension SavedViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) ->CGFloat {
        let cellHieght: CGFloat = 100
        return cellHieght
    }
}


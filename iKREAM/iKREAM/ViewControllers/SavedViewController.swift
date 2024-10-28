//
//  SavedViewController.swift
//  iKREAM
//
//  Created by 김윤진 on 10/19/24.
//

import UIKit

class SavedViewController: UIViewController {

    let data = dummySavedModel.savedDatas
    
    // MARK: - Properties
    let savedPageView = SavedView()
    
    // MARK: - Life Cycle
    override func loadView() {
        self.view = savedView  // 인스턴스를 할당
    }
    
    private lazy var savedView: SavedView = {
        let view = iKREAM.SavedView()
        view.tableView.dataSource = self
        view.tableView.delegate = self
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 데이터의 개수를 기반으로 ttl 라벨 업데이트
        savedView.ttl.text = "전체 \(data.count)개"
        
    }
}

extension SavedViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SavedCell.identifier, for: indexPath) as? SavedCell else {
            return UITableViewCell()
        }
        
        cell.configure(model: data[indexPath.row])
        
        return cell
    }
}

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
        view.savedTableView.delegate = self
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { //셀이 선택됐을 때
        if indexPath.row == 0 { // 0번째 인덱스일 때
            let detailViewController = DetailPageViewController()
            detailViewController.hidesBottomBarWhenPushed = true // 탭 바 숨김 설정
            navigationController?.pushViewController(detailViewController, animated: true) // 화면 전환 (Navigation)
        }
        tableView.deselectRow(at: indexPath, animated: true) // 선택 셀 자동해제
    }
}


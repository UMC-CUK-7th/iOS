//
//  SearchDetailViewController.swift
//  KREAM
//
//  Created by 류한비 on 11/19/24.
//

import UIKit
import Moya

class SearchDetailViewController: UIViewController {
    
    private var data: [Product] = [] // 네트워크에서 가져온 데이터를 저장할 배열
    
    private lazy var searchDetailView: SearchDetailView = {
        let view = SearchDetailView()
        view.searchTableView.dataSource = self
        view.searchTableView.delegate = self
        return view
    }()
    
    override func loadView() {
        self.view = searchDetailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupActions()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // 텍스트 필드 활성화
        searchDetailView.searchTextField.becomeFirstResponder()
    }
    
    //MARK: - Setup Actions
    private func setupActions() {
        cancelButtonAction()
        backButtonAction()
        searchDetailView.searchTextField.delegate = self // 텍스트 필드 delegate 설정
    }
    
    //MARK: - 취소버튼
    // 취소 버튼 액션
    private func cancelButtonAction() {
        searchDetailView.cancleButton.addTarget(self, action: #selector(cancelButtonDidTap), for: .touchUpInside)
    }
    
    // 취소 버튼 클릭시 homeView로 전환
    @objc
    private func cancelButtonDidTap() {
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    //MARK: - 뒤로가기 버튼
    // 뒤로가기 버튼 액션
    private func backButtonAction() {
        searchDetailView.backButton.addTarget(self, action: #selector(backButtonDidTap), for: .touchUpInside)
    }
    
    // 뒤로가기 버튼 클릭시 검색화면으로 전환
    @objc
    private func backButtonDidTap() {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Properties
    private let provider = MoyaProvider<SearchTargetType>() // 네트워크 요청을 수행할 Provider 객체를 선언
    var myResponse: SearchResponseModel?
    var d: [Int]?
    
    //MARK: - Network
    private func getSearchData(with text: String) {
        provider.request(.getAllSearchData(text: text)) { [weak self] result in
            switch result {
            case .success(let response):
                print("통신성공")
                do {
                    let decoder = JSONDecoder() // JSON 데이터 변환
                    let response = try decoder.decode(SearchResponseModel.self, from: response.data)
                    self?.data = response.products // 네트워크에서 가져온 데이터를 업데이트
                    DispatchQueue.main.async {
                        self?.searchDetailView.searchTableView.reloadData() // 테이블 뷰 갱신
                    }
                } catch { // 예외처리
                    print("디코딩 실패")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}


// MARK: - UITextFieldDelegate
extension SearchDetailViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Return 키가 눌렸을 때 키보드를 내림
        textField.resignFirstResponder()
        
        // TextField에 입력된 값 가져옴
        guard let searchText = textField.text, !searchText.isEmpty else {
            print("검색어가 입력되지 않았습니다.")
            return true
        }
        
        // 입력받은 검색어로 데이터 요청
        getSearchData(with: searchText)
        return true
    }
}

//MARK: - UITableView DataSource
extension SearchDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if data.isEmpty { return 0 }
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchDetailTableViewCell.identifier, for: indexPath) as? SearchDetailTableViewCell else { return UITableViewCell() }
        let product = data[indexPath.row]
        cell.configure(model: product) // 모델로 셀 구성
        return cell
    }
}

//MARK: - UITableView Delegate
extension SearchDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellHeight: CGFloat = 47
        return cellHeight
    }
}

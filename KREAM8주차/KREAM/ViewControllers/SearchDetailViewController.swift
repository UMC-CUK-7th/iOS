//
//  SearchDetailViewController.swift
//  KREAM
//
//  Created by 서재민 on 11/22/24.
//

import UIKit
import Moya
class SearchDetailViewController: UIViewController {
    
    //MARK: - Properties
     var recommendWord : [Product] = [] // 받아온 데이터 저장
    let searchDetailView = SearchDetailView()
    
    //MARK: - LifeCycle
    
    override func loadView() {
        view = searchDetailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        searchDetailView.recommendWordTableView.dataSource = self
        searchDetailView.recommendWordTableView.delegate = self
        searchDetailView.searchTextField.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        searchDetailView.searchTextField.becomeFirstResponder()

    }
    
    
    //MARK: - Func
    
    //
    private func setupNavigationBar(){
        let cancelButton = UIBarButtonItem(title: "취소",style: .plain, target: self, action: #selector(cancelButtonTapped))
        self.navigationItem.rightBarButtonItem = cancelButton
    }
    
    //homeview로 돌아가기
   @objc private func cancelButtonTapped() {
       navigationController?.popToRootViewController(animated: true)
    }
    //테이블 뷰 리셋
    private func updateUI(with responseDTO: ResponseDTO){
        searchDetailView.recommendWordTableView.reloadData()
    }
    
    
    //MARK: - Network
    
    private let provider = MoyaProvider<KreamTargetType>()
    var myResponse: ResponseDTO?
    var d:[Int]?
    

    private func getSearchData(with word : String){
        provider.request(.getSearch(text: word)){result in
            switch result {
            case.success(let response):
                print("통신성공")
                
                do {
                    let decoder = JSONDecoder()
                    print("통신확인1")
                    let response = try decoder.decode(ResponseDTO.self, from: response.data)
                 //   print("통신확인2")
                    self.recommendWord = response.products // 데이터 담기
                    print("통신확인3")
                    DispatchQueue.main.async {
                                          self.updateUI(with: response)
                                      }
//메인스레드에서 비동기적으로 진행하고, 테이블뷰 리로드함수 실행
                    
                }
                catch {
                    print("디코딩 실패")
                }
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}

//MARK: - Extension
extension SearchDetailViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recommendWord.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == searchDetailView.recommendWordTableView{
            let searchRecommendWordTableCell = tableView.dequeueReusableCell(withIdentifier: SearchRecommendWordTableCell.identifier, for: indexPath) as! SearchRecommendWordTableCell
            searchRecommendWordTableCell.configure(model: recommendWord[indexPath.row])
            return searchRecommendWordTableCell
        }
        
        return UITableViewCell()
    }
}
//셀간격
extension SearchDetailViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cell: CGFloat = 31
        return cell
    }
}

extension SearchDetailViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        guard let searchText = textField.text, !searchText.isEmpty else { return true}
        getSearchData(with: searchText)
        return true
        }
}

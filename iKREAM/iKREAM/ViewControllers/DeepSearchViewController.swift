//
//  DeepSearchViewController.swift
//  iKREAM
//
//  Created by 김윤진 on 11/21/24.
//

import UIKit
import SnapKit
import Moya
import Then

class DeepSearchViewController: UIViewController {
    
    private let deepsearchView = DeepSearchView()
    private let provider = MoyaProvider<SearchTargetType>()
    var myResponse: ResponseDTO?
    
    private let backButtonImageView = UIImageView()
    private let resultsStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 10
        $0.alignment = .leading
        $0.distribution = .fill
    }
    
    override func loadView() {
        self.view = deepsearchView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackButtonImageView()
        setupSearchTextField()
        setupResultsStackView()
    }
    
    private func fetchData(searchText: String) {
        print("검색어: \(searchText)") // 추가된 로그
        provider.request(.getSearch(text: searchText)) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let response):
                print("응답 데이터: \(String(data: response.data, encoding: .utf8) ?? "데이터 없음")")
                
                do {
                    let decoder = JSONDecoder()
                    let decodedResponse = try decoder.decode(ResponseDTO.self, from: response.data)
                    self.myResponse = decodedResponse
                    print("디코딩 성공: \(decodedResponse)")
                    
                    // 검색 결과 출력
                    print("검색결과: \(decodedResponse.products)") // 추가된 로그
                    self.displaySearchResults(decodedResponse.products.map { $0.title })
                    
                } catch {
                    print("디코딩 실패: \(error)")
                }
                
            case .failure(let error):
                print("통신 실패: \(error.localizedDescription)")
            }
        }
    }
    
    private func setupSearchTextField() {
        let searchTextField = deepsearchView.search2TextField
        searchTextField.delegate = self
    }
    
    private func setupResultsStackView() {
        view.addSubview(resultsStackView)
        
        resultsStackView.snp.makeConstraints { make in
            make.top.equalTo(deepsearchView.search2TextField.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview().inset(16)
        }
    }
    
    private func displaySearchResults(_ titles: [String]) {
        // 기존 검색 결과 제거
        resultsStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        if titles.isEmpty {
            // 검색 결과가 없을 때 메시지 표시
            let noResultsLabel = UILabel().then {
                $0.text = "검색 결과가 없습니다."
                $0.font = .systemFont(ofSize: 14, weight: .regular)
                $0.textColor = .gray
                $0.textAlignment = .center
            }
            resultsStackView.addArrangedSubview(noResultsLabel)
            return
        }
        
        // 최대 3개의 제목 표시
        let limitedTitles = titles.prefix(3)
        for title in limitedTitles {
            let label = UILabel().then {
                $0.text = title
                $0.font = .systemFont(ofSize: 14, weight: .regular)
                $0.textColor = .black
                $0.numberOfLines = 1
            }
            resultsStackView.addArrangedSubview(label)
        }
    }
    
    private func setupBackButtonImageView() {
        let backButtonImage = UIImage(named: "backImage 1")?.withRenderingMode(.alwaysOriginal)
        backButtonImageView.image = backButtonImage
        backButtonImageView.contentMode = .scaleAspectFit

        view.addSubview(backButtonImageView)
        backButtonImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.top.equalToSuperview().offset(69)
            make.width.height.equalTo(24)
        }

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(backButtonTapped))
        backButtonImageView.isUserInteractionEnabled = true
        backButtonImageView.addGestureRecognizer(tapGesture)
    }
    
    @objc func backButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - UITextFieldDelegate
extension DeepSearchViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let searchText = textField.text?.trimmingCharacters(in: .whitespacesAndNewlines), !searchText.isEmpty else {
            print("검색어가 비어 있습니다.")
            let alert = UIAlertController(title: "알림", message: "검색어를 입력해주세요.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default))
            present(alert, animated: true)
            return false
        }
        
        print("검색어 입력: \(searchText)") // 추가된 로그
        textField.resignFirstResponder()
        fetchData(searchText: searchText) // API 호출
        return true
    }
}

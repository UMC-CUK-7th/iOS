//
//  SearchTextViewController.swift
//  iKREAM
//
//  Created by 김윤진 on 11/7/24.
//

import UIKit
import SnapKit

class SearchTextViewController: UIViewController, UICollectionViewDelegateFlowLayout, UITextFieldDelegate {

    private let searchtextView = SearchTextView()

    override func loadView() {
        self.view = searchtextView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        setupDelegate()
        setupCollectionView() // 컬렉션 뷰 설정 추가
        setButtonActions()
        setupSearchTextFieldTapGesture()
    }

    // MARK: - Set Button Actions
    private func setButtonActions() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapCancelLabel))
        searchtextView.cancleLabel.isUserInteractionEnabled = true
        searchtextView.cancleLabel.addGestureRecognizer(tapGesture)
    }

    // MARK: - Selectors
    @objc
    private func didTapCancelLabel() {
        // 이전 화면으로 돌아갑니다.
        dismiss(animated: true, completion: nil) // 모달 닫기
    }
    
    private func setupSearchTextFieldTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(search2TextFieldTapped))
        searchtextView.search2TextField.addGestureRecognizer(tapGesture)
        searchtextView.search2TextField.isUserInteractionEnabled = true
    }

    @objc private func didTapSearchField() {
        let deepSearchVC = DeepSearchViewController() // DeepSearchViewController 인스턴스 생성
        navigationController?.pushViewController(deepSearchVC, animated: true) // Push 방식으로 이동
    }

    private func setupCollectionView() {
        // 셀 등록
        searchtextView.chucheonCollectionView.register(chucheonCollectionViewCell.self, forCellWithReuseIdentifier: chucheonCollectionViewCell.identifier)
    }

    private func setupDelegate() {
        searchtextView.chucheonCollectionView.delegate = self
        searchtextView.chucheonCollectionView.dataSource = self
        
        // UITextField의 Delegate 설정
        searchtextView.search2TextField.delegate = self
    }
    
    // MARK: - UITextFieldDelegate
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // 텍스트 필드 편집 시작 시 호출됩니다.
        let searchtextViewController = SearchTextViewController()
        navigationController?.pushViewController(searchtextViewController, animated: true)
    }
    
    // deepsearchViewController를 탭했을 때 호출되는 메서드
    @objc private func search2TextFieldTapped() {
        let deepsearchViewController = DeepSearchViewController()
        deepsearchViewController.modalPresentationStyle = .overFullScreen // 탭 바를 숨기지 않도록 설정
        present(deepsearchViewController, animated: true, completion: nil)
    }

    @objc private func segmentedControlValueChanged(segment: UISegmentedControl) {
        if segment.selectedSegmentIndex == 0 {
            searchtextView.chucheonCollectionView.isHidden = false
        } else {
            searchtextView.chucheonCollectionView.isHidden = true
        }
    }
}

// MARK: - UICollectionViewDataSource
extension SearchTextViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == searchtextView.chucheonCollectionView {
            return ChucheonModel.dummy().count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == searchtextView.chucheonCollectionView {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: chucheonCollectionViewCell.identifier,
                for: indexPath
            ) as? chucheonCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            // ChucheonModel 객체에 접근하여 getter 사용
            let model = ChucheonModel.dummy()[indexPath.row]
            cell.configure(with: model)
            
            return cell
        }
        return UICollectionViewCell()
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension SearchTextViewController {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == searchtextView.chucheonCollectionView {
            let model = ChucheonModel.dummy()[indexPath.row]
            return model.size // 모델에서 정의된 크기를 반환
        }
        return CGSize.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12 // 세로 간격 설정
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8 // 좌우 간격 설정
    }
}

// MARK: - collectionView : Configure func
extension chucheonCollectionViewCell {
    func configure(with model: ChucheonModel) {
        // titleLabel이 정의되어 있어야 합니다. 예를 들어, 아래와 같이 설정합니다.
        supremeTextLabel.text = model.keyName // model의 keyName을 텍스트로 설정
    }
}

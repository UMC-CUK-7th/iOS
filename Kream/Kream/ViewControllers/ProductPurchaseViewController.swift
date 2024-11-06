//
//  ProductPurchaseViewController.swift
//  KREAM
//
//  Created by 류한비 on 11/6/24.
//

import UIKit

class ProductPurchaseViewController: UIViewController {
    var productImage: UIImage? { // 이미지 전달받을 변수
        didSet{ // productImage를 설정할 때마다 setImage()가 자동으로 호출.
            setImage()
        } // didSet은 값이 설정된 후에 호출되어, productImage를 설정할 때마다 이미지가 뷰에 적용되도록 함.
    }
    
    let productPurchaseView = ProductPurchaseView()
    private var buttonArray: [UIButton] = []  // 사이즈 버튼을 저장할 배열 생성
    
    override func loadView() {
        self.view = productPurchaseView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cancleButtonAction()
        setupButtonArray()
        // setImage() // viewDidLoad에서 호출하면 이미지가 아직 DetailPageViewController에서 전달되지 않아서 보이지 않는듯..합니다
        // 뷰가 화면에 완전히 나타난 후에 호출되게끔, viewDidAppear에서 호출하면 미세하게 이미지게 늦게 로드되는 감이 있어서 didSet에대해 알아보고 사용했습니답..
    }
    
    private func setupButtonArray(){
        // 모든 사이즈 버튼을 배열에 추가
        buttonArray = [
            productPurchaseView.smallButton,
            productPurchaseView.mediumButton,
            productPurchaseView.largeButton,
            productPurchaseView.xlargeButton,
            productPurchaseView.xxlargeButton
        ]
        
        // 사이즈 버튼 액션
        for button in buttonArray {
            button.addTarget(self, action: #selector(buttonDidTap(_:)), for: .touchUpInside)
        }
    }
    
    // 사이즈 버튼 클릭시 하이라이트 변경
    @objc
        private func buttonDidTap(_ sender: UIButton) { // 클릭된 버튼이 sender로 전달됨.
            // 모든 버튼의 borderColor 초기화
            for button in buttonArray {
                button.layer.borderColor = UIColor.clear.cgColor
            }
            // 클릭된 버튼의 borderColor를 검정색으로 변경
            sender.layer.borderColor = UIColor.black.cgColor
        }
    
    // 상품 이미지 전달
    private func setImage() {
        productPurchaseView.productImage.image = productImage
    }
    
    // 취소버튼 액션
    private func cancleButtonAction() {
        productPurchaseView.cancleButton.addTarget(self, action: #selector (purchaseButtonDidTap), for: .touchUpInside)
    }
    
    // 취소버튼 클릭시 화면전환
    @objc
    private func purchaseButtonDidTap() {
        dismiss(animated: true)
    }
    
}

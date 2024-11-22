//
//  PurchaseButtonTapViewController.swift
//  KREAM
//
//  Created by 서재민 on 11/8/24.
//

import UIKit

class PurchaseButtonTapViewController: UIViewController {
    //MARK: - Properties
    let purchasButtonTapView = PurchaseButtonTapView()
    
    lazy var buttonArray: [UIButton] = [
        purchasButtonTapView.sizeSButton,
        purchasButtonTapView.sizeMButton,
        purchasButtonTapView.sizeLButton,
        purchasButtonTapView.sizeXLButton,
        purchasButtonTapView.sizeXXLButton
    ]
    
    //MARK: -LifeCycle
    override func loadView() {
        self.view = PurchaseButtonTapView()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.purchasButtonTapView.XButton.addTarget(self, action: #selector(XButtonActionDidTap), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //setProductImage()
        setupNavigationBar()
    }
    
    //MARK: - Function
  
    private func setupNavigationBar() {
        if let XImage = UIImage(named: "XButton.png")?.withRenderingMode(.alwaysOriginal) { // 사진이 기본값에 영향을 받지않게끔 
            let xBarButtonItem = UIBarButtonItem(image: XImage, style: .plain, target: self, action: #selector(XButtonActionDidTap))
            self.navigationItem.rightBarButtonItem = xBarButtonItem
        }
    }
    
    // 모달뷰 해제
    @objc
    private func XButtonActionDidTap(){
        self.dismiss( animated: true)
        print(#function)
    }
    
    @objc
    private func sizeButtonDidTap(){
        for button in buttonArray{
            button.addTarget(self, action: #selector(sizeButton(_:)), for: .touchUpInside)
        }
    }
   
    //버튼 선택시 보더라인색 바꾸기
    @objc
    private func sizeButton(_ sender: UIButton){
        for _ in buttonArray{
            sender.layer.borderColor = UIColor.lightGray.cgColor
        }
        sender.layer.borderColor = UIColor.black.cgColor
    }
    
}

//
//  HomeViewController.swift
//  KREAM
//
//  Created by 서재민 on 10/23/24.
//

import UIKit

class HomeViewController: UIViewController {
   
    //MARK: -Properties
    private let homeView = HomeView()
    private let homeJustDroppedCell = HomeJustDroppedCell()
   
    
    //MARK: - LifeCycle
    override func loadView() {
        self.view = homeView
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpAction()
        setUpDelegate()
    }
    

    //MARK: - func
    //세그 컨트롤 인덱스값업데이트시 실행될 메서드
    private func setUpAction(){
        homeView.SegmentedControl.addTarget(self, action: #selector(SegmentedControlValueChanged(segment:)), for: .valueChanged)
        homeJustDroppedCell.button.addTarget(self, action:#selector(didTapButton), for: .touchUpInside)
    
    }

    
    private func setUpDelegate(){
        homeView.HomeCollectionView.dataSource = self
        homeView.HomeCollectionView.delegate = self
        homeView.justDroppedCollectionView.dataSource = self
        homeView.justDroppedCollectionView.delegate = self
        homeView.homeHanpaCollectionView.dataSource = self
        homeView.homeHanpaCollectionView.delegate = self
    }
    
    @objc
    private func SegmentedControlValueChanged(segment: UISegmentedControl){
        if segment.selectedSegmentIndex == 0 {
            homeView.HomeCollectionView.isHidden = false
            homeView.Emptylabel.isHidden = true
            homeView.HomeAD.isHidden = false
            homeView.justDroppedLabel1.isHidden = false
            homeView.justDroppedCollectionView.isHidden = false
            homeView.justDroppedLabel2.isHidden = false
            homeView.homeHanpaCollectionView.isHidden = false
            homeView.divideLine.isHidden = false
            homeView.hanpaLabel.isHidden = false
            homeView.hanpaSubLabel.isHidden = false
            
        }
        else{
            homeView.HomeCollectionView.isHidden = true
            homeView.Emptylabel.isHidden = false
            homeView.HomeAD.isHidden = true
            homeView.justDroppedCollectionView.isHidden = true
            homeView.justDroppedLabel1.isHidden = true
            homeView.justDroppedLabel2.isHidden = true
            homeView.homeHanpaCollectionView.isHidden = true
            homeView.divideLine.isHidden = true
            homeView.hanpaLabel.isHidden = true
            homeView.hanpaSubLabel.isHidden = true

            
        }
    }
    

    
    
        
    
    
}


//MARK: - Extension
extension HomeViewController : UICollectionViewDataSource{
   
    // previousView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == homeView.HomeCollectionView{
            return HomeModel.dummy().count
        }
        else if collectionView == homeView.justDroppedCollectionView{
            return HomeJustDroppedModel.HomeJustDroppedDummy().count
        }
        
        else if collectionView == homeView.homeHanpaCollectionView{
            return HomeHanpaModel.HomeHanpaDummy().count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == homeView.HomeCollectionView{
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCell.identifier, for: indexPath) as? HomeCell else { return UICollectionViewCell() }
                
                  let list = HomeModel.dummy()
                  cell.imageView.image=list[indexPath.row].image
                  cell.titleLabel.text = list[indexPath.row].title
                  return cell
        }
        
        else if collectionView == homeView.justDroppedCollectionView{
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeJustDroppedCell.identifier, for: indexPath) as? HomeJustDroppedCell else{ return UICollectionViewCell()}
            
                let list2 = HomeJustDroppedModel.HomeJustDroppedDummy()
            cell.imageView.image=list2[indexPath.row].image
            cell.titleLabel.text = list2[indexPath.row].title
            cell.subTitleLabel.text = list2[indexPath.row].subtitle
            cell.priceLabel.text = list2[indexPath.row].price
            cell.delegate = self
            return cell
        }
        
        else if collectionView == homeView.homeHanpaCollectionView{
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeHanpaCell.identifier, for: indexPath) as? HomeHanpaCell else{ return UICollectionViewCell()}
            
            let list3 = HomeHanpaModel.HomeHanpaDummy()
            cell.imageView.image=list3[indexPath.row].image
            cell.label.text = list3[indexPath.row].ig
            
            return cell
        }
        
        return UICollectionViewCell()
    }
    
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
}

extension HomeViewController: CollectionViewCellDelegate {
    @objc func didTapButton(in cell: HomeJustDroppedCell) {
        // indexPath를 사용하여 데이터 전달
        if let indexPath = homeView.justDroppedCollectionView.indexPath(for: cell) {
            if indexPath.row == 0{
                let detailVC = JustDroppedDetailViewController()
                detailVC.recievedData = HomeJustDroppedModel.HomeJustDroppedDummy()[indexPath.row].image
                navigationController?.pushViewController(detailVC, animated: true)
            }
        }
    }
}

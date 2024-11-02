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
    
    @objc
    private func didTapSearchButton(){
        
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
            guard let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: HomeJustDroppedCell.identifier, for: indexPath) as? HomeJustDroppedCell else{ return UICollectionViewCell()}
            
                let list2 = HomeJustDroppedModel.HomeJustDroppedDummy()
            cell2.imageView.image=list2[indexPath.row].image
            cell2.titleLabel.text = list2[indexPath.row].title
            cell2.subTitleLabel.text = list2[indexPath.row].subtitle
            cell2.priceLabel.text = list2[indexPath.row].price
            return cell2
        }
        
        else if collectionView == homeView.homeHanpaCollectionView{
            guard let cell3 = collectionView.dequeueReusableCell(withReuseIdentifier: HomeHanpaCell.identifier, for: indexPath) as? HomeHanpaCell else{ return UICollectionViewCell()}
            
            let list3 = HomeHanpaModel.HomeHanpaDummy()
            cell3.imageView.image=list3[indexPath.row].image
            cell3.label.text = list3[indexPath.row].ig
            
            return cell3
        }
    
        
        return UICollectionViewCell()
    }
    
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
}

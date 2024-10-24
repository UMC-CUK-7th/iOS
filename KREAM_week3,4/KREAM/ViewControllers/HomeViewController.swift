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
    }
    
    @objc
    private func SegmentedControlValueChanged(segment: UISegmentedControl){
        if segment.selectedSegmentIndex == 0 {
            homeView.HomeCollectionView.isHidden = false
            homeView.Emptylabel.isHidden = true
        }
    }
    
    @objc
    private func didTapSearchButton(){
        
    }
    
}

//MARK: - Extension
extension HomeViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return HomeModel.dummy().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCell.identifier, for: indexPath) as? HomeCell else { return UICollectionViewCell() }
      
        let list = HomeModel.dummy()
        cell.imageView.image=list[indexPath.row].image
        cell.titleLabel.text = list[indexPath.row].title
        return cell
        
    }
    
}



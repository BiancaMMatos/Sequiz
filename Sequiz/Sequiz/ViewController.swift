//
//  ViewController.swift
//  Sequiz
//
//  Created by Bianca Maciel Matos on 20/12/23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    // MARK: - Properties
    private var images: [UIImage] = []
    
    // MARK: - UI Components
    private var titleLabel = UILabel()
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        collectionView.backgroundColor = .accent
                       
        collectionView.contentInset = .init(top: 40, left: 25, bottom: 20, right: 25)
        
        collectionView.alwaysBounceVertical = true
        collectionView.alwaysBounceHorizontal = false
        collectionView.showsVerticalScrollIndicator = false
        
        return collectionView
    }()
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()
        
        images.append(UIImage(named: "Friends")!)
        images.append(UIImage(named: "Game of Thrones")!)
        images.append(UIImage(named: "How I Met You Mother")!)
        images.append(UIImage(named: "Lost")!)
        images.append(UIImage(named: "PLL")!)
        images.append(UIImage(named: "The Bear")!)
        
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
    }


    private func configureUI() {
        view.backgroundColor = .accent
        
        self.view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(self.view.snp.top).offset(0)
            make.bottom.equalTo(self.view.snp.bottom).offset(0)
            make.leading.equalTo(self.view.snp.leading).offset(0)
            make.trailing.equalTo(self.view.snp.trailing).offset(0)
        }
        
    }

}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell 
        else { return UICollectionViewCell() }
        
        let image = self.images[indexPath.row]
        cell.configureImage(with: image)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.images.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size = (self.view.frame.width/2) - 6 /// 6  = (espacing (12) x número de espaços entre as cells (1))  / número de cells por linha (2)
        
        return CGSize(width: size * 0.80, height: size * 0.80)
        
    }
    
    // Vertical Spacing
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
    
    // Horizontal Spacing
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
    
}


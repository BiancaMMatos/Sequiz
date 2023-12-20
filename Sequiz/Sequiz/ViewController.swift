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
       return collectionView
    }()
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()
        
        for _ in 0...6 {
            images.append(UIImage(named: "Friends") ?? UIImage())
            images.append(UIImage(named: "Game of Thrones") ?? UIImage())
            images.append(UIImage(named: "How I Met You Mother") ?? UIImage())
            images.append(UIImage(named: "Lost") ?? UIImage())
            images.append(UIImage(named: "PLL") ?? UIImage())
            images.append(UIImage(named: "The Bear") ?? UIImage())
        }
        
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


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
    private var images: [UIImage] = [ UIImage(named: "Friends")!,
                                      UIImage(named: "Game of Thrones")!,
                                      UIImage(named: "How I Met You Mother")!,
                                      UIImage(named: "Lost")!,
                                      UIImage(named: "PLL")!,
                                      UIImage(named: "The Bear")!
    ]
    
    // MARK: - UI Components
    private var titleLabel = UILabel()
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CustomButtonCollectionViewCell.self, forCellWithReuseIdentifier: CustomButtonCollectionViewCell.identifier)
        collectionView.backgroundColor = .accent
                       
        collectionView.contentInset = .init(top: 40, left: 25, bottom: 20, right: 25)
        
        collectionView.alwaysBounceVertical = true
        collectionView.alwaysBounceHorizontal = false
        collectionView.showsVerticalScrollIndicator = false
        
        return collectionView
    }()
    
    private let imgButton: UIButton = {
        let btn = UIButton()
        let image = UIImage(systemName: "questionmark")
        btn.setImage(image, for: .normal)
        
        return btn
    }()
        
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()
        
        setImage()
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
    }

    // MARK: - Functions
    private func configureUI() {
        self.view.backgroundColor = .accent
        
        self.view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(self.view.snp.top).offset(0)
            make.bottom.equalTo(self.view.snp.bottom).offset(0)
            make.leading.equalTo(self.view.snp.leading).offset(0)
            make.trailing.equalTo(self.view.snp.trailing).offset(0)
        }
    }
    
    private func setImage() {
        for image in images {
            self.imgButton.setImage(image, for: .normal)
        }
    }
    
    @objc func buttonPressed() {
        print("Botão pressionado")
    }

}

// MARK: - Extension UICollectionView
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomButtonCollectionViewCell.identifier, for: indexPath) as? CustomButtonCollectionViewCell
        else { return CustomButtonCollectionViewCell() }
        
        let image = self.images[indexPath.row]
        let button = self.imgButton
        cell.configureButton(with: button, image: image)
        cell.imgButton.addTarget(self, action: #selector(self.buttonPressed), for: .touchUpInside)
        
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


//
//  CustomButtonCollectionViewCell.swift
//  Sequiz
//
//  Created by Bianca Maciel Matos on 24/12/23.
//

import UIKit
import SnapKit

class CustomButtonCollectionViewCell: UICollectionViewCell {
    
    
    // MARK: - Properties
    static let identifier = "CustomButtonCollectionViewCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(systemName: "questionmark")
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    var imgButton: UIButton = {
        let btn = UIButton()
        let image = UIImage(systemName: "questionmark")
        btn.setImage(image, for: .normal)
        
        return btn
    }()
    
    // MARK: - Lifecycle
    override func prepareForReuse() {
        super.prepareForReuse()
        self.imageView.image = nil /// refreshing the cell
    }
    
    
    // MARK: - Functions
//    func configureImage(with image: UIImage) {
//        
//    }

    private func setupImageUI() {
        self.backgroundColor = .white
        
        self.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(0)
            make.bottom.equalTo(self.snp.bottom).offset(0)
            make.leading.equalTo(self.snp.leading).offset(0)
            make.trailing.equalTo(self.snp.trailing).offset(0)
        }
    }
    
    func configureButton(with button: UIButton, image: UIImage) {
        self.imgButton.setImage(image, for: .normal)
        self.setupButtonUI()
        //self.imageView.image = image
        //self.setupImageUI()
    }
    
    private func setupButtonUI() {
        self.addSubview(imgButton)
        imgButton.translatesAutoresizingMaskIntoConstraints = false
        
        imgButton.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(0)
            make.bottom.equalTo(self.snp.bottom).offset(0)
            make.leading.equalTo(self.snp.leading).offset(0)
            make.trailing.equalTo(self.snp.trailing).offset(0)
        }
    }
    
    func getImage(image: UIImage) -> UIImage {
        return image
    }
    
}

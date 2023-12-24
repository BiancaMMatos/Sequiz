//
//  CustomCollectionViewCell.swift
//  Sequiz
//
//  Created by Bianca Maciel Matos on 22/12/23.
//

import UIKit
import SnapKit

class CustomCollectionViewCell: UICollectionViewCell {
 
    // MARK: - Properties
    static let identifier = "CustomCollectionViewCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(systemName: "questionmark")
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    // MARK: - Lifecycle
    override func prepareForReuse() {
        super.prepareForReuse()
        self.imageView.image = nil /// refreshing the cell
    }
    
    
    // MARK: - Functions
    func configureImage(with image: UIImage) {
        self.imageView.image = image
        self.setupUI()
    }
    
    private func setupUI() {
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
    
}

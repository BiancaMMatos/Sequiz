//
//  QuizView.swift
//  Sequiz
//
//  Created by Bianca Maciel Matos on 24/12/23.
//

import UIKit
import SnapKit

class QuizView: UIViewController {
    
    
    // MARK: - Properties
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(systemName: "questionmark")
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupImage(imageView: imageView)
    }
    
    // MARK: - Functions
    private func setupImage(imageView: UIImageView) {
        
        self.view.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(self.view.snp.top).offset(0)
            make.bottom.equalTo(self.view.snp.bottom).offset(0)
            make.leading.equalTo(self.view.snp.leading).offset(0)
            make.trailing.equalTo(self.view.snp.trailing).offset(0)
        }
        
    }
    
}

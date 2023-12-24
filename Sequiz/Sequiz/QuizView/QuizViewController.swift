//
//  QuizView.swift
//  Sequiz
//
//  Created by Bianca Maciel Matos on 24/12/23.
//

import UIKit
import SnapKit

class QuizViewController: UIViewController {
    
    
    // MARK: - Properties
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "questionmark")
        imageView.clipsToBounds = true
                
        return imageView
    }()
    
    private let textLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Quem é este personagem?"
        label.font = UIFont.systemFont(ofSize: 20.0)
        label.numberOfLines = 0
        label.sizeToFit()
        
        return label
    }()
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .newWhite
        
        setupImage(imageView: imageView)
        setupLabel(label: textLabel)
    }
    
    // MARK: - Functions
    private func setupImage(imageView: UIImageView) {
        
        self.view.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.snp.makeConstraints { make in
            
            make.centerX.equalToSuperview().offset(0)
            make.centerY.equalToSuperview().offset(-250)
            make.leading.top.greaterThanOrEqualTo(10)
            make.trailing.bottom.lessThanOrEqualTo(10)
            make.width.height.equalToSuperview().priority(.high)

            make.height.lessThanOrEqualTo(150)
            make.width.lessThanOrEqualTo(150)
        }
        
    }
    
    private func setupLabel(label: UILabel) {
        
        self.view.addSubview(textLabel)
        
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        
        textLabel.snp.makeConstraints { make in
            
            make.centerX.equalToSuperview().offset(0)
            make.centerY.equalToSuperview().offset(-100)
            
            make.leading.top.greaterThanOrEqualTo(75)
            make.trailing.bottom.lessThanOrEqualTo(75)
            make.width.height.equalToSuperview().priority(.high)
            
        }
    }
    
}

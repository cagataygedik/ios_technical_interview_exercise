//
//  ContainerViewTwo.swift
//  Pollexa
//
//  Created by Celil Çağatay Gedik on 22.05.2024.
//

import UIKit
import SnapKit

final class ContainerViewTwo: UIView {
    
    // UI Components
    private let timestampLabel = TitleLabel(size: 12, color: .lightGray, weight: .semibold, fontName: "SF Pro", alignment: .left)
    private let questionLabel = TitleLabel(size: 17, color: .black, weight: .semibold, fontName: "SF Pro", alignment: .left)
    private let optionOneImageView = UIImageView()
    private let optionTwoImageView = UIImageView()
    private let voteCountLabel = TitleLabel(size: 13, color: .lightGray, weight: .regular, fontName: "SF Pro", alignment: .left)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        // Add subviews
        addSubview(timestampLabel)
        addSubview(questionLabel)
        addSubview(optionOneImageView)
        addSubview(optionTwoImageView)
        addSubview(voteCountLabel)
        
        // Configure subviews
        optionOneImageView.contentMode = .scaleAspectFill
        optionTwoImageView.contentMode = .scaleAspectFill
        optionOneImageView.clipsToBounds = true
        optionTwoImageView.clipsToBounds = true
        optionOneImageView.layer.cornerRadius = 8
        optionTwoImageView.layer.cornerRadius = 8
        optionOneImageView.layer.borderWidth = 1
        optionTwoImageView.layer.borderWidth = 1
        optionOneImageView.layer.borderColor = UIColor.lightGray.cgColor
        optionTwoImageView.layer.borderColor = UIColor.lightGray.cgColor
        
        // Setup constraints using SnapKit
        timestampLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        questionLabel.snp.makeConstraints { make in
            make.top.equalTo(timestampLabel.snp.bottom).offset(8)
            make.leading.trailing.equalTo(timestampLabel)
        }
        
        optionOneImageView.snp.makeConstraints { make in
            make.top.equalTo(questionLabel.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalTo(self.snp.centerX).offset(-8)
            make.height.equalTo(optionOneImageView.snp.width).multipliedBy(0.75)
        }
        
        optionTwoImageView.snp.makeConstraints { make in
            make.top.equalTo(optionOneImageView)
            make.leading.equalTo(self.snp.centerX).offset(8)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(optionOneImageView)
        }
        
        voteCountLabel.snp.makeConstraints { make in
            make.top.equalTo(optionOneImageView.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-16)
        }
    }
    
    // Configure the view with data
    func configure(with timestamp: String, content: String, optionOneImage: UIImage, optionTwoImage: UIImage, voteCount: String) {
        timestampLabel.text = timestamp
        questionLabel.text = content
        optionOneImageView.image = optionOneImage
        optionTwoImageView.image = optionTwoImage
        voteCountLabel.text = voteCount
    }
}

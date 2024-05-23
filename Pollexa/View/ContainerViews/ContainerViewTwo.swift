//
//  ContainerViewTwo.swift
//  Pollexa
//
//  Created by Celil Çağatay Gedik on 22.05.2024.
//

import UIKit
import SnapKit

final class ContainerViewTwo: UIView {
    
    private let timestampLabel = TitleLabel(size: 12, color: .lightGray, weight: .semibold, fontName: "SF Pro", alignment: .left)
    private let questionLabel = TitleLabel(size: 17, color: .black, weight: .semibold, fontName: "SF Pro", alignment: .left)
    private let optionOneImageView = UIImageView()
    private let optionTwoImageView = UIImageView()
    private let voteCountLabel = TitleLabel(size: 13, color: .lightGray, weight: .regular, fontName: "SF Pro", alignment: .left)
    private let optionsStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        setupImageViews()
        setupOptionsStackView()
        addSubviews()
        setupConstraints()
    }
    
    private func setupImageViews() {
        [optionOneImageView, optionTwoImageView].forEach {
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 10
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.lightGray.cgColor
        }
        optionOneImageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        optionTwoImageView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
    }
    
    private func setupOptionsStackView() {
        optionsStackView.axis = .horizontal
        optionsStackView.distribution = .fillEqually
        optionsStackView.spacing = 4
        optionsStackView.addArrangedSubview(optionOneImageView)
        optionsStackView.addArrangedSubview(optionTwoImageView)
    }
    
    private func addSubviews() {
        addSubview(timestampLabel)
        addSubview(questionLabel)
        addSubview(optionsStackView)
        addSubview(voteCountLabel)
    }
    
    private func setupConstraints() {
        timestampLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        questionLabel.snp.makeConstraints { make in
            make.top.equalTo(timestampLabel.snp.bottom).offset(8)
            make.leading.trailing.equalTo(timestampLabel)
        }
        
        optionsStackView.snp.makeConstraints { make in
            make.top.equalTo(questionLabel.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(129)
            make.width.equalTo(348)
        }
        
        voteCountLabel.snp.makeConstraints { make in
            make.top.equalTo(optionsStackView.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().offset(-16)
        }
    }
    
    func configure(with timestamp: String, content: String, optionOneImage: UIImage, optionTwoImage: UIImage, voteCount: String) {
        timestampLabel.text = timestamp
        questionLabel.text = content
        optionOneImageView.image = optionOneImage
        optionTwoImageView.image = optionTwoImage
        voteCountLabel.text = voteCount
    }
}

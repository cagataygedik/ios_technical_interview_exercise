//
//  ActivePollsHeaderView.swift
//  Pollexa
//
//  Created by Celil Çağatay Gedik on 23.05.2024.
//

import UIKit

final class ActivePollsHeaderViewCell: UICollectionReusableView {
    static let reuseID = "ActivePollsHeaderViewCell"
    
    private let customTitleLabel = TitleLabel(size: 20, color: .white, weight: .semibold, fontName: "SF Pro", alignment: .left)
    private let secondaryTitleLabel = TitleLabel(size: 16, color: .white.withAlphaComponent(0.7), weight: .semibold, fontName: "SF Pro", alignment: .left)
    private let stackView = UIStackView()
    private let arrowImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        configureStackView()
        configureLabels()
        configureArrowImageView()
        configureCellAppearance()
    }
    
    private func configureStackView() {
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 2
        stackView.addArrangedSubview(customTitleLabel)
        stackView.addArrangedSubview(secondaryTitleLabel)
        addSubview(stackView)
    }
    
    private func configureLabels() {
        customTitleLabel.text = "2 Active Polls"
        secondaryTitleLabel.text = "See Details"
    }
    
    private func configureArrowImageView() {
        let arrowImage = UIImage(systemName: "arrow.right")
        arrowImageView.image = arrowImage
        arrowImageView.tintColor = UIColor(named: "AccentColor")
        arrowImageView.backgroundColor = .white
        arrowImageView.layer.cornerRadius = 4
        arrowImageView.layer.masksToBounds = true
        addSubview(arrowImageView)
    }
    
    private func configureCellAppearance() {
        backgroundColor = UIColor(named: "AccentColor")
        layer.cornerRadius = 20
    }
    
    private func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
        }
        
        arrowImageView.snp.makeConstraints { make in
            make.width.equalTo(30)
            make.height.equalTo(30)
            make.trailing.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
        }
    }
}


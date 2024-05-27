//
//  ContainerViewOne.swift
//  Pollexa
//
//  Created by Celil Çağatay Gedik on 22.05.2024.
//

import UIKit
import SnapKit

final class ContainerViewOne: UIView {
    
    // UI Components
    private let profileImageView = CircularProfileImageView()
    private let usernameLabel = TitleLabel(size: 17, color: .black, weight: .semibold, fontName: "SF Pro", alignment: .left)
    private let timestampLabel = TitleLabel(size: 15, color: .lightGray, weight: .semibold, fontName: "SF Pro", alignment: .right)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(profileImageView)
        addSubview(usernameLabel)
        addSubview(timestampLabel)
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        timestampLabel.translatesAutoresizingMaskIntoConstraints = false
        
        profileImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(40)
        }
        
        usernameLabel.snp.makeConstraints { make in
            make.leading.equalTo(profileImageView.snp.trailing).offset(8)
            make.centerY.equalTo(profileImageView)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        timestampLabel.snp.makeConstraints { make in
            make.leading.equalTo(usernameLabel)
            make.centerY.equalTo(usernameLabel)
            make.trailing.equalTo(usernameLabel)
            make.bottom.equalToSuperview().offset(-8)
        }
    }
    
    func configure(with user: User, timestamp: String) {
        profileImageView.setImage(user.image)
        usernameLabel.text = user.username
        timestampLabel.text = timestamp
    }
}

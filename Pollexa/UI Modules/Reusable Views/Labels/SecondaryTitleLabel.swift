//
//  SecondaryTitleLabel.swift
//  Pollexa
//
//  Created by Celil Çağatay Gedik on 22.05.2024.
//

import UIKit
final class SecondaryTitleLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        self.textColor = .white.withAlphaComponent(0.7)
        self.textAlignment = .left
        self.numberOfLines = 1
        if let customFont = UIFont(name: "SF Pro", size: 16) {
            self.font = UIFontMetrics.default.scaledFont(for: customFont)
        } else {
            self.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        }
    }
}


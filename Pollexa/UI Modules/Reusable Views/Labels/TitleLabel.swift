//
//  BodyLabel.swift
//  Pollexa
//
//  Created by Celil Çağatay Gedik on 22.05.2024.
//

import UIKit
final class TitleLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        self.textColor = .white
        self.textAlignment = .left
        self.numberOfLines = 1
        if let customFont = UIFont(name: "SF Pro", size: 20) {
            self.font = UIFontMetrics.default.scaledFont(for: customFont)
        } else {
            self.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        }
    }
}


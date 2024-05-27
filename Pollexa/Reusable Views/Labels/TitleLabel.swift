//
//  BodyLabel.swift
//  Pollexa
//
//  Created by Celil Çağatay Gedik on 22.05.2024.
//

import UIKit

final class TitleLabel: UILabel {

    init(size: CGFloat, color: UIColor, weight: UIFont.Weight = .regular, fontName: String? = nil, alignment: NSTextAlignment = .left) {
        super.init(frame: .zero)
        configure(size: size, color: color, weight: weight, fontName: fontName, alignment: alignment)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(size: CGFloat, color: UIColor, weight: UIFont.Weight, fontName: String?, alignment: NSTextAlignment) {
        self.textColor = color
        self.textAlignment = alignment
        self.numberOfLines = 2
        updateFont(size: size, weight: weight, fontName: fontName)
    }
    
    private func updateFont(size: CGFloat, weight: UIFont.Weight, fontName: String?) {
        if let fontName = fontName, let customFont = UIFont(name: fontName, size: size) {
            self.font = UIFontMetrics.default.scaledFont(for: customFont)
        } else {
            self.font = UIFont.systemFont(ofSize: size, weight: weight)
        }
    }
}


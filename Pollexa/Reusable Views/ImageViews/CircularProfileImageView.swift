//
//  CircularButtonView.swift
//  Pollexa
//
//  Created by Celil Çağatay Gedik on 22.05.2024.
//

import UIKit
import SnapKit

final class CircularProfileImageView: UIView {
    private let button = UIButton(type: .custom)

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupButton() {
        addSubview(button)
        button.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.height.equalTo(40)
        }
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.layer.borderWidth = 0.1
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.backgroundColor = UIColor.systemBlue.withAlphaComponent(0.2)
    }

    func setImage(_ image: UIImage?) {
        button.setImage(image, for: .normal)
    }

    func addTarget(_ target: Any?, action: Selector, for controlEvents: UIControl.Event) {
        button.addTarget(target, action: action, for: controlEvents)
    }
}

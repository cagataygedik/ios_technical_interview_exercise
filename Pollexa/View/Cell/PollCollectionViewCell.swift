//
//  PollCollectionViewCell.swift
//  Pollexa
//
//  Created by Celil Çağatay Gedik on 23.05.2024.
//

import UIKit

final class PollCollectionViewCell: UICollectionViewCell {
    
    static let reuseID = "PollCollectionViewCell"
    
    private let containerViewOne = ContainerViewOne()
    private let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "SeperatorColor")?.withAlphaComponent(0.2)
        return view
    }()
    private let containerViewTwo = ContainerViewTwo()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        contentView.addSubview(containerViewOne)
        contentView.addSubview(separatorView)
        contentView.addSubview(containerViewTwo)
        
        containerViewOne.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(60)
        }
        
        separatorView.snp.makeConstraints { make in
            make.top.equalTo(containerViewOne.snp.bottom).offset(4)
            make.leading.trailing.equalToSuperview().inset(8)
            make.height.equalTo(0.5)
        }
        
        containerViewTwo.snp.makeConstraints { make in
            make.top.equalTo(containerViewOne.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        contentView.layer.cornerRadius = 25
        contentView.layer.masksToBounds = true
        
    }
    
    func configure(with viewModel: PollCardViewModel) {
        containerViewOne.configure(with: viewModel.user, timestamp: viewModel.createdAt)
        containerViewTwo.configure(
            with: viewModel.createdAt,
            content: viewModel.content,
            optionOneImage: viewModel.optionOneImage,
            optionTwoImage: viewModel.optionTwoImage,
            voteCount: viewModel.voteCount
        )
    }
}


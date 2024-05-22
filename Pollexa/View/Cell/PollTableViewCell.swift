//
//  PollTableViewCell.swift
//  Pollexa
//
//  Created by Celil Çağatay Gedik on 22.05.2024.
//

import UIKit
import SnapKit

final class PollTableViewCell: UITableViewCell {
    
    private let containerViewOne = ContainerViewOne()
    private let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "SeperatorColor")?.withAlphaComponent(0.2)
        return view
    }()
    
    private let containerViewTwo = ContainerViewTwo()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        contentView.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(containerViewOne)
        contentView.addSubview(separatorView)
        contentView.addSubview(containerViewTwo)
        
        containerViewOne.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(16)
        }
        
        separatorView.snp.makeConstraints { make in
            make.top.equalTo(containerViewOne.snp.bottom).offset(12)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(0.5)
        }
        
        containerViewTwo.snp.makeConstraints { make in
            make.top.equalTo(separatorView.snp.bottom).offset(8)
            make.leading.trailing.bottom.equalToSuperview().inset(16)
        }
    }
    
    func configure(with viewModel: PollViewModel) {
        let user = User(id: UUID().uuidString, username: viewModel.username, image: viewModel.userImage)
        containerViewOne.configure(with: user, timestamp: viewModel.timestamp)
        containerViewTwo.configure(with: viewModel.timestamp, content: viewModel.content, optionOneImage: viewModel.optionOneImage, optionTwoImage: viewModel.optionTwoImage, voteCount: viewModel.voteCount)
    }
    
}

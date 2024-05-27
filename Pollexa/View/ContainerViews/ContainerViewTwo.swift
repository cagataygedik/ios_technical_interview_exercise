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
    private let optionOneLikeButton = UIButton()
    private let optionTwoLikeButton = UIButton()
    private let voteCountLabel = TitleLabel(size: 13, color: .lightGray, weight: .regular, fontName: "SF Pro", alignment: .left)
    private let optionsStackView = UIStackView()
    
    private var optionOneVotes = 0
    private var optionTwoVotes = 0
    private var totalVotes: Int {
        return optionOneVotes + optionTwoVotes
    }
    private var userHasVoted = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        setupImageViews()
        setupLikeButtons()
        setupOptionsStackView()
        addSubviews()
        setupConstraints()
        addGestureRecognizers()
    }
    
    private func setupImageViews() {
        [optionOneImageView, optionTwoImageView].forEach {
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 10
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.lightGray.cgColor
            $0.isUserInteractionEnabled = true
        }
        optionOneImageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        optionTwoImageView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
    }
    
    private func setupLikeButtons() {
            [optionOneLikeButton, optionTwoLikeButton].forEach {
                $0.setImage(UIImage(systemName: "hand.thumbsup.fill"), for: .normal)
                $0.tintColor = UIColor(named: "AccentColor")
                $0.backgroundColor = .white
                $0.layer.cornerRadius = 15
                $0.layer.masksToBounds = true
                $0.addTarget(self, action: #selector(didTapLikeButton(_:)), for: .touchUpInside)
            }
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
        optionOneImageView.addSubview(optionOneLikeButton)
        optionTwoImageView.addSubview(optionTwoLikeButton)
    }
    
    private func setupConstraints() {
        timestampLabel.translatesAutoresizingMaskIntoConstraints = false
        timestampLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        questionLabel.snp.makeConstraints { make in
            make.top.equalTo(timestampLabel.snp.bottom).offset(8)
            make.leading.trailing.equalTo(timestampLabel)
        }
        
        optionsStackView.translatesAutoresizingMaskIntoConstraints = false
        optionsStackView.snp.makeConstraints { make in
            make.top.equalTo(questionLabel.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(129)
            make.width.equalTo(348)
        }
        
        voteCountLabel.translatesAutoresizingMaskIntoConstraints = false
        voteCountLabel.snp.makeConstraints { make in
            make.top.equalTo(optionsStackView.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().offset(-16)
        }
        
        optionOneLikeButton.translatesAutoresizingMaskIntoConstraints = false
        optionOneLikeButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
            make.width.height.equalTo(30)
        }
        
        optionTwoLikeButton.translatesAutoresizingMaskIntoConstraints = false
        optionTwoLikeButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
            make.width.height.equalTo(30)
        }
    }
    
    private func addGestureRecognizers() {
        let optionOneTapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapOptionOne))
        optionOneImageView.addGestureRecognizer(optionOneTapGesture)
        
        let optionTwoTapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapOptionTwo))
        optionTwoImageView.addGestureRecognizer(optionTwoTapGesture)
    }
    
    @objc private func didTapLikeButton(_ sender: UIButton) {
        if sender == optionOneLikeButton {
            didTapOptionOne()
        } else if sender == optionTwoLikeButton {
            didTapOptionTwo()
        }
    }
    
    @objc private func didTapOptionOne() {
        guard !userHasVoted else { return }
        optionOneVotes += 1
        userHasVoted = true
        updateVoteCount()
        highlightSelectedOption(option: 1)
    }
    
    @objc private func didTapOptionTwo() {
        guard !userHasVoted else { return }
        optionTwoVotes += 1
        userHasVoted = true
        updateVoteCount()
        highlightSelectedOption(option: 2)
    }
    
    private func updateVoteCount() {
        let optionOnePercentage = totalVotes > 0 ? (optionOneVotes * 100 / totalVotes) : 0
        let optionTwoPercentage = totalVotes > 0 ? (optionTwoVotes * 100 / totalVotes) : 0
        voteCountLabel.text = "\(totalVotes) Total Votes"
    }
    
    private func highlightSelectedOption(option: Int) {
        if option == 1 {
            optionOneImageView.layer.borderColor = UIColor.blue.cgColor
            optionTwoImageView.layer.borderColor = UIColor.lightGray.cgColor
        } else {
            optionTwoImageView.layer.borderColor = UIColor.blue.cgColor
            optionOneImageView.layer.borderColor = UIColor.lightGray.cgColor
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

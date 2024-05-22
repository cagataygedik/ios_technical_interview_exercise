//
//  DiscoverViewController.swift
//  Pollexa
//
//  Created by Emirhan Erdogan on 13/05/2024.
//

import UIKit
import SnapKit

final class DiscoverViewController: UIViewController {
    private let postProvider = PostProvider.shared
    private let profileButtonView = CircularProfileImageView()
    private let activePollsButton = ActivePollsButton()
    private let pollTableView = PollTableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        addActivePollsButton()
        setupPollTableView()
        fetchPosts()
    }
    
    private func setupPollTableView() {
        view.addSubview(pollTableView)
        pollTableView.snp.makeConstraints { make in
            make.top.equalTo(activePollsButton.snp.bottom).offset(20)
            make.leading.trailing.bottom.equalToSuperview().inset(16)
        }
        pollTableView.layer.cornerRadius = 25
        pollTableView.clipsToBounds = true
        pollTableView.backgroundColor = .white
    }
    
    private func fetchPosts() {
        postProvider.fetchAll { result in
            switch result {
            case .success(let posts):
                self.pollTableView.viewModels = posts.map { post in
                    PollViewModel(
                        userImage: post.user.image,
                        username: post.user.username,
                        timestamp: DateFormatter.localizedString(from: post.createdAt, dateStyle: .short, timeStyle: .short),
                        content: post.content,
                        optionOneImage: post.options[0].image,
                        optionTwoImage: post.options[1].image,
                        voteCount: "\(Int.random(in: 1...100)) Total Votes" // Example vote count
                    )
                }
                self.pollTableView.reloadData()
                
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }
    }
    
    private func addActivePollsButton() {
        activePollsButton.addTarget(self, action: #selector(activePollsButtonTapped), for: .touchUpInside)
        view.addSubview(activePollsButton)
        activePollsButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
        }
    }
    
    @objc private func activePollsButtonTapped() {
        print("Go to active polls")
    }
    
    private func configureViewController() {
        view.backgroundColor = UIColor(named: "BackgroundColor")
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Discover"
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        
        addNavigationItems()
    }
    
    
    private func addNavigationItems() {
        addPlusButton()
        addProfileButton()
    }
    
    private func addPlusButton() {
        let plusButton = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(plusButtonTapped))
        navigationItem.rightBarButtonItem = plusButton
    }
    
    @objc private func plusButtonTapped() {
        print("plus button tapped")
    }
    
    private func addProfileButton() {
        profileButtonView.setImage(UIImage(named: "avatar_1")?.withRenderingMode(.alwaysOriginal))
        profileButtonView.addTarget(self, action: #selector(profileButtonTapped), for: .touchUpInside)
        let leftBarButtonItem = UIBarButtonItem(customView: profileButtonView)
        navigationItem.leftBarButtonItem = leftBarButtonItem
        
        profileButtonView.snp.makeConstraints { make in
            make.width.height.equalTo(40)
        }
    }
    
    @objc private func profileButtonTapped() {
        print("profile button tapped")
    }
}

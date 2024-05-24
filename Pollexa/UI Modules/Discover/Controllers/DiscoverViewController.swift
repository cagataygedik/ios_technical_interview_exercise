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
    private let pollCardView = PollCardView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        setupPollCardView()
        fetchPosts()
    }
    
    private func fetchPosts() {
        postProvider.fetchAll { result in
            switch result {
            case .success(let posts):
                self.pollCardView.configure(with: posts) // Configure PollCardView with posts
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }
    }
    
    private func setupPollCardView() {
        view.addSubview(pollCardView)
        pollCardView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func configureViewController() {
        view.backgroundColor = UIColor(named: "BackgroundColor")
        navigationItem.title = "Discover"
        navigationController?.navigationBar.prefersLargeTitles = true
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

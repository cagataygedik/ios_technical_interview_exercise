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

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        addActivePollsButton()
        fetchPosts()
    }
    
    private func fetchPosts() {
        postProvider.fetchAll { result in
            switch result {
            case .success(let posts):
                print(posts)

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
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Discover"
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

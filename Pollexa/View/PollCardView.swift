//
//  PollCardView.swift
//  Pollexa
//
//  Created by Celil Çağatay Gedik on 23.05.2024.
//

import UIKit

final class PollCardView: UIView {
    
    private let collectionView: UICollectionView
    private var viewModels = [PollCardViewModel]()
    
    override init(frame: CGRect) {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        super.init(frame: frame)
        setupCollectionView()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(PollCollectionViewCell.self, forCellWithReuseIdentifier: PollCollectionViewCell.reuseID)
        collectionView.backgroundColor = UIColor(named: "BackgroundColor")
    }
    
    private func setupView() {
        addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func configure(with posts: [Post]) {
        viewModels = posts.map { PollCardViewModel(post: $0) }
        collectionView.reloadData()
    }
}

extension PollCardView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PollCollectionViewCell", for: indexPath) as! PollCollectionViewCell
        let viewModel = viewModels[indexPath.item]
        cell.configure(with: viewModel)
        return cell
    }
}


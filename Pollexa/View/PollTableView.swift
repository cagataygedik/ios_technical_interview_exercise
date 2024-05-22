//
//  PollTableView.swift
//  Pollexa
//
//  Created by Celil Çağatay Gedik on 22.05.2024.
//

import UIKit

final class PollTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    var viewModels = [PollViewModel]()
    
    init() {
        super.init(frame: .zero, style: .plain)
        self.delegate = self
        self.dataSource = self
        self.register(PollTableViewCell.self, forCellReuseIdentifier: "PollTableViewCell")
        self.separatorStyle = .none
        self.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count // fix here
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PollTableViewCell", for: indexPath) as? PollTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: viewModels[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
}


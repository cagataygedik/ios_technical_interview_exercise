//
//  PollCardViewModel.swift
//  Pollexa
//
//  Created by Celil Çağatay Gedik on 23.05.2024.
//

import UIKit

class PollCardViewModel {
    
    // MARK: - Properties
    private let post: Post
    private let dateFormatter: DateFormatter
    
    // MARK: - Init
    init(post: Post) {
        self.post = post
        self.dateFormatter = DateFormatter()
        self.dateFormatter.dateStyle = .medium
        self.dateFormatter.timeStyle = .none
    }
    
    // MARK: - Methods
    var user: User {
        return post.user
    }
    
    var username: String {
        return post.user.username
    }
    
    var userImage: UIImage {
        return post.user.image
    }
    
    var createdAt: String {
        return dateFormatter.string(from: post.createdAt)
    }
    
    var content: String {
        return post.content
    }
    
    var optionOneImage: UIImage {
        return post.options[0].image
    }
    
    var optionTwoImage: UIImage {
        return post.options[1].image
    }
    
    var voteCount: String {
        // Assuming vote count is not provided, so returning a static text
        return "6 Total Votes"
    }
}


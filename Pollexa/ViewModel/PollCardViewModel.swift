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
    var optionOneVotes: Int
    var optionTwoVotes: Int
    var userHasVoted: Bool
    
    // MARK: - Init
    init(post: Post) {
        self.post = post
        self.dateFormatter = DateFormatter()
        self.dateFormatter.dateStyle = .medium
        self.dateFormatter.timeStyle = .none
        self.optionOneVotes = 0
        self.optionTwoVotes = 0
        self.userHasVoted = false
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
    
    var totalVotes: Int {
        return optionOneVotes + optionTwoVotes
    }
    
    var voteCount: String {
        return "\(totalVotes) Total Votes"
    }
    
    var optionOnePercentage: String {
        let percentage = totalVotes > 0 ? (optionOneVotes * 100 / totalVotes) : 0
        return "\(percentage)%"
    }
    
    var optionTwoPercentage: String {
        let percentage = totalVotes > 0 ? (optionTwoVotes * 100 / totalVotes) : 0
        return "\(percentage)%"
    }
}


// RedditPost.swift
// Models for decoding Reddit’s /hot listing

import Foundation

struct RedditListing: Codable {
    struct ListingData: Codable {
        struct Child: Codable {
            struct PostData: Codable {
                let id: String
                let title: String
            }
            let data: PostData
        }
        let children: [Child]
    }

    let data: ListingData

    var posts: [RedditPost] {
        data.children.map {
            RedditPost(id: $0.data.id, title: $0.data.title)
        }
    }
}

struct RedditPost: Identifiable {
    let id: String
    let title: String
}

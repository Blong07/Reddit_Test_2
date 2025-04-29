//
//  File4.swift
//  Reddit_Test_2
//

//

// (Optional) RedditAPI.swift

import Foundation

struct RedditToken: Codable {
    let access_token: String
    let refresh_token: String?
    let expires_in: Int
}

struct RedditUser: Codable {
    let name: String
    // add other fields as needed
}

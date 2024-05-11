//
//  PostData.swift
//  TheSpoke
//
//  Created by Rhea Malik on 11/5/22.
//

import Foundation

enum Category: Codable {
    case news, telife, sports, opinion, other
}

struct NewsPost {
    let post: Post
    let image: String?
}

struct Content: Codable {
    let rendered: String?
}

struct Title: Codable {
    let rendered: String?
}

struct ImageLink: Codable {
    let image: [Image] // just array of length 1 (or 0)
    
    enum CodingKeys: String, CodingKey {
        case image = "wp:attachment"
    }
}

struct Image: Codable {
    let imageJsonlink: String
    enum CodingKeys: String, CodingKey {
        case imageJsonlink = "href"
    }
}

struct JSONImage: Codable {
    let guid: ImageGuid
}

struct ImageGuid: Codable {
    let rendered: String
}

struct Post: Codable, Identifiable {
    let id: Int
    let date: String?
    let title: Title
    let content: Content
    let link: String?
    let imageLink: ImageLink
    
    enum CodingKeys: String, CodingKey {
        case imageLink = "_links", id, date, title, content, link
    }
    
    var category: Category {
        if let link = link {
            if (link.contains("/news")) {
                return Category.news
            }
            if (link.contains("/opinion")) {
                return Category.opinion
            }
            if (link.contains("/te-life")) {
                return Category.telife
            }
            if (link.contains("/sports")) {
                return Category.sports
            }
        }
        return Category.other
    }
}

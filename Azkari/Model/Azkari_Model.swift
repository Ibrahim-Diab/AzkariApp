//
//  Azkari_Model.swift
//  Azkari
//
//  Created by Deepo on 29/09/2021.
//

import Foundation

let url = "https://ahegazy.github.io/muslimKit/json/azkar_sabah.json"

struct AzkariModel: Codable {
    let title: String
    let content: [Content]
}

// MARK: - Content
struct Content: Codable {
    let zekr: String
    let contentRepeat: Int
    let bless: String

    enum CodingKeys: String, CodingKey {
        case zekr
        case contentRepeat = "repeat"
        case bless
    }
}





struct DataAndTime: Codable {
    let category, count, dataAndTimeDescription, reference: String
    let content: String

    enum CodingKeys: String, CodingKey {
        case category, count
        case dataAndTimeDescription = "description"
        case reference, content
    }
}

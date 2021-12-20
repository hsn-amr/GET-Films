//
//  Films.swift
//  GET People
//
//  Created by administrator on 20/12/2021.
//

import Foundation

// MARK: - Welcome
struct FilmsWelcome: Codable {
    let count: Int
    let results: [FilmResult]
}

// MARK: - Result
struct FilmResult: Codable {
    let title: String
    let episodeID: Int
    let openingCrawl, director, producer, releaseDate: String
    let characters, planets, starships, vehicles: [String]
    let species: [String]
    let created, edited: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case title
        case episodeID = "episode_id"
        case openingCrawl = "opening_crawl"
        case director, producer
        case releaseDate = "release_date"
        case characters, planets, starships, vehicles, species, created, edited, url
    }
}

//
//  FootballData.swift
//  FootballStats
//
//  Created by Roro on 04/04/24.
//

import Foundation
import SwiftUI

struct FootballModel: Codable {
    
    let status: Bool
    let data: FootballData
    
    static var sample: FootballModel {
        return FootballModel(
            status: true,
            data: FootballData(
                name: "English Premier League",
                seasonDisplay: "2020-2021",
                season: 2021,
                standings: [
                    TeamStandings(
                        team: Team (
                            id: "382",
                            uid: "cga5",
                            name: "ManCity",
                            location: "Manchester City",
                            abbreviation: "MNC",
                            logos: [
                                TeamLogo(
                                    href: "https://a.espncdn.com/i/teamlogos/soccer/500/382.png"
                                )
                            ], isFavorite: false
                        ),
                        stats: [
                            TeamStats(displayName: "Games Played", abbreviation: "GP", displayValue: "38"),
                            TeamStats(displayName: "Loses", abbreviation: "L", displayValue: "2"),
                            TeamStats(displayName: "Wins", abbreviation: "W", displayValue: "17"),
                            TeamStats(displayName: "Draws", abbreviation: "D", displayValue: "4"),
                            TeamStats(displayName: "Points", abbreviation: "P", displayValue: "4"),
                            TeamStats(displayName: "Points-Per-Game", abbreviation: "PPG", displayValue: "2.6"),
                            TeamStats(displayName: "Point Deductions", abbreviation: "PD", displayValue: ""),
                            TeamStats(displayName: "Rank", abbreviation: "R", displayValue: "1"),
                            TeamStats(displayName: "Draws", abbreviation: "D", displayValue: "4")
                        ]
                    )
                ]
            )
        )
    }
    
    static var sampledesc: Description {
        return Description (abb: "MNC", desc: "Manchester City Football Club is a professional football club based in Manchester, England, that competes in the Premier League, the top flight of English football. Founded in 1880 as St. Mark's, they became Ardwick Association Football Club in 1887 and Manchester City in 1894.")
    }
}

struct FootballData: Codable {
    let name: String
    let seasonDisplay: String
    let season: Int
    let standings: [TeamStandings]
}

struct TeamStandings: Codable {
    let team: Team
    let stats: [TeamStats]
}

struct Team: Codable,Identifiable {
    let id: String
    let uid: String
    let name: String
    let location: String
    let abbreviation: String
    let logos: [TeamLogo]?
    var isFavorite: Bool?
}

struct TeamLogo: Codable {
    let href: String
}

struct TeamStats: Codable {
    let displayName: String
    let abbreviation: String
    let displayValue: String
}

struct Description: Codable {
    let abb: String
    let desc: String
}

struct League: Codable {
    let status: Bool
    let data: [LeagueData]
    
    static var sampleLeague: League {
        return League(
            status: true, 
            data: [
                LeagueData(
                    id: "eng.1", name: "Premier League", logos: LeagueLogos(light: "https://a.espncdn.com/i/leaguelogos/soccer/500/23.png")
                )
            ]
        )
    }
}

struct LeagueData: Codable {
    let id: String
    let name: String
    let logos: LeagueLogos
}

struct LeagueLogos: Codable {
    let light: String
}

struct LeagueSeasons: Codable {
    let status: Bool
    let data: LeagueSeasonsData
}

struct LeagueSeasonsData: Codable {
    let name: String
    let seasons: [Seasons]
}

struct Seasons: Codable {
    let year: Int
}

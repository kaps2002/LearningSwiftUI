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
    let data: Data
    
    static var sample: FootballModel {
        return FootballModel(
            status: true,
            data: Data(
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
                            ]
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
}

struct Data: Codable {
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
    let logos: [TeamLogo]
}

struct TeamLogo: Codable {
    let href: String
}

struct TeamStats: Codable {
    let displayName: String
    let abbreviation: String
    let displayValue: String
}

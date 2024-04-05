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
                            TeamStats(displayName: "Games Played", displayValue: "38", abbreviation: "GP"),
                            TeamStats(displayName: "Loses", displayValue: "2", abbreviation: "L"),
                            TeamStats(displayName: "Wins", displayValue: "17", abbreviation: "W"),
                            TeamStats(displayName: "Draws", displayValue: "4", abbreviation: "D"),
                            TeamStats(displayName: "Points", displayValue: "4", abbreviation: "P"),
                            TeamStats(displayName: "Points-Per-Game", displayValue: "2.6", abbreviation: "PPG"),
                            TeamStats(displayName: "Point Deductions", displayValue: "0", abbreviation: "PD"),
                            TeamStats(displayName: "Rank", displayValue: "1", abbreviation: "R"),
                            TeamStats(displayName: "Draws", displayValue: "4", abbreviation: "D")

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
    let displayValue: String
    let abbreviation: String
}

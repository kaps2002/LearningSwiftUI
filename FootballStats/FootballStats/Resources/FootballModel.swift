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
    let data: LeagueData
    struct LeagueData: Codable {
        let name: String
        let seasonDisplay: String
        let season: Int
        let standings: [TeamStanding]
        
        struct TeamStanding: Codable {
            let team: Team
            
            struct Team: Codable {
                let id: String
                let name: String
                let logos: [TeamLogo]
                
                struct TeamLogo: Codable {
                    let href: String
                }
            }
        }
    }
    static var sample: FootballModel {
        return FootballModel(
            status: true,
            data: LeagueData(
                name: "English Premier League",
                seasonDisplay: "2020-2021",
                season: 2021,
                standings: [
                    LeagueData.TeamStanding(
                        team: LeagueData.TeamStanding.Team(
                            id: "001",
                            name: "ManCity",
                            logos: [
                                LeagueData.TeamStanding.Team.TeamLogo(
                                    href: "https://a.espncdn.com/i/teamlogos/soccer/500/382.png"
                                )
                            ]
                        )
                    )
                ]
            )
        )
    }
}
                    
                    
                    
                    
                    

//
//  ContentView.swift
//  FootballStats
//
//  Created by Roro on 04/04/24.
//

import SwiftUI

struct FootballStatsView: View {
    
    @State var footballmodel: FootballModel?
    @State private var viewModel = FootballViewModel()
    @State private var selection: String?
    @State private var lastSelection = UserDefaults.standard.string(forKey: "season")
    @State private var searchTerm = ""
    @State private var isStarClick = false
    @State private var isSeasonAvail = true
    @State var selectedLeague: String?
    @State var uniqueId: String
    @State private var selectedFilter = ""

    init(uniqueId: String, selectedLeague: String?) {
        self.uniqueId = uniqueId
        self.selectedLeague = selectedLeague
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).backgroundColor = UIColor.white
        UISearchTextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).attributedPlaceholder = NSAttributedString(string: "Search", attributes: [.foregroundColor: UIColor.gray])
    }
    
    var filteredTeams: [TeamStandings] {
        guard  !searchTerm.isEmpty else { return viewModel.footballmodel?.data.standings ?? [] }
        
        return viewModel.filterTeams(searchTerm: searchTerm, teamStandings: (viewModel.footballmodel?.data.standings)!)
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                if viewModel.isDark {
                    Color.black
                        .ignoresSafeArea()
                } else {
                    Color.white
                        .ignoresSafeArea()
                }
                
                ZStack {
                    if viewModel.isLoading {
                        ProgressView()
                    } else {
                        if isSeasonAvail {
                            ScrollView {
                                ForEach(filteredTeams , id: \.team.id) { teamstanding in
                                    NavigationLink {
                                        FootballStatsDetailsView(footballstatsdetails: teamstanding.stats, footballstats: teamstanding.team, isStarClick: $isStarClick)
                                            .padding(.top, -30)
                                            .foregroundColor(viewModel.isDark ? .white : .black)
                                            .background(viewModel.isDark ? .black : .white)
                                        
                                    } label: {
                                        FootballStatsRowView(footballstats: teamstanding.team, isStarClick: $isStarClick)
                                            .foregroundColor(viewModel.isDark ? .white : .black)
                                    }
                                }
                            }
                            .listStyle(.plain)
                            .scrollIndicators(.never)
                            .padding(.top, 50)
                            .padding(.horizontal, 15)
                            
                        } else {
                            NoSeasonView()
                                .foregroundColor(viewModel.isDark ? .white : .gray)
                        }
                    }
                    VStack(alignment: .center) {
                        HStack {
                            Text("Choose a Season")
                                .foregroundColor(viewModel.isDark ? .white : .black)
                                .font(.title2)
                                .fontWeight(.semibold)
                            Spacer()
                            DropdownView(hint: lastSelection ?? "Select", options: viewModel.leagueSeason?.data.seasons.reversed() ?? [], selection: $selection)
                                .onChange(of: selection) {
                                    viewModel.isLoading = true
                                    viewModel.fetchProducts(season: selection!, uniqueId) { response in
                                        if response {
                                            isSeasonAvail = true
                                        } else {
                                            isSeasonAvail = false
                                        }
                                        viewModel.isLoading = false
                                    }
                                    UserDefaults.standard.setValue(selection!, forKey: "season")
                                }
                        }
                        .padding(.horizontal, 15)
                        Spacer()
                    }
                }
            }
            .navigationTitle("Football Stats ⚽️")
            .searchable(text: $searchTerm, prompt: "Search your team")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    LeagueChangeView(viewModel: $viewModel, uniqueId: $uniqueId, selectedLeague: $selectedLeague, selection: $selection, lastSelection: $lastSelection, isSeasonAvail: $isSeasonAvail)
                        .foregroundColor(.blue)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        Button("Profile") {
                            
                        }

                        Toggle(isOn: $viewModel.isDark) {
                            Label(viewModel.isDark ? "Dark Mode" : "Light Mode", systemImage: viewModel.isDark ? "moon.fill" : "sun.max.fill")
                                .fontWeight(.semibold)
                        }
                        
                        Button("Logout") {
                        }
                        
                    } label: {
                        Image(systemName: "person.circle")
                            .foregroundColor(viewModel.isDark ? .white : .darkBlue)
                            .font(.title)
                            .imageScale(.medium)
                    }
                    .menuStyle(DefaultMenuStyle())
                }
            })
            .background(NavigationConfigurator { navController in
                let appearance = UINavigationBarAppearance()
                appearance.configureWithOpaqueBackground()
                appearance.largeTitleTextAttributes = [.foregroundColor: viewModel.isDark ? UIColor.white : UIColor.black]
                navController.navigationBar.standardAppearance = appearance
            })
            .task {
                viewModel.fetchTotalSeasons(uniqueId)
                viewModel.fetchSeason(season: ((selection ?? lastSelection) ?? "2023"), uniqueId) { response in
                    viewModel.isLoading = false
                    if response {
                        isSeasonAvail = true
                    } else {
                        isSeasonAvail = false
                    }
                }
            }
        }
    }
}

struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void

    func makeUIViewController(context: Context) -> UIViewController {
        UIViewController()
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        if let navigationController = uiViewController.navigationController {
            self.configure(navigationController)
        }
    }
}

#Preview {
    FootballStatsView(uniqueId: "eng.1", selectedLeague: "")
}

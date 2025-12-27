//
//  MainTabView.swift
//  YogaDemoApp
//
//  Created by ShaniHalali on 27/12/2025.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 0
    var body: some View {
        TabView(selection: $selectedTab) {
            // my plan
            NavigationStack {
                MyPlanView()
            }
            .tabItem {
                Image(selectedTab == 0 ? "tab_bar_myplan_selected" : "tab_bar_myplan_unselected")
                Text("My Plan")
            }
            .tag(0)
            
            // my library
            NavigationStack {
                Text("Library Placeholder")
            }
            .tabItem {
                Image(selectedTab == 1 ? "tab_bar_library_selected" : "tab_bar_library_unselected")
                Text("Library")
            }
            .tag(1)
            
            //Milestones
            NavigationStack {
                Text("Milestones Placeholder")
            }
            .tabItem {
                Image(selectedTab == 2 ? "tab_bar_achievements_selected" : "tab_bar_achievements_unselected")
                Text("Milestones")
            }
            .tag(2)
            
            //More
            NavigationStack {
                Text("More Placeholder")
            }
            .tabItem {
                Image(selectedTab == 3 ? "tab_bar_more_selected" : "tab_bar_more_unselected")
                Text("My Plan")
            }
            .tag(3)


        }
    }
}

#Preview {
    MainTabView()
}


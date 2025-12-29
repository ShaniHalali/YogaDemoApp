//
//  MyPlanView.swift
//  YogaDemoApp
//
//  Created by ShaniHalali on 27/12/2025.
//

import SwiftUI

struct MyPlanView: View {
    @State private var selectedSessionId: String?
    @State private var sessions: [SessionItem] = SessionDataService.loadSessions()
    
    // computed property for find out the session by id
    private var selectedSession: SessionItem? {
        guard let id = selectedSessionId else { return nil }
        let session = sessions.first { $0.id == id }
        return session
    }

    var body: some View {
        let session = selectedSession
        ZStack {
            //background
            Image("chapter\(session?.chapter ?? 1)_bg")
            Color.gray.opacity(0.2)
                .ignoresSafeArea()
            
            VStack(spacing: 10) {
                VStack(spacing: 4) {
                    Text("MY PLAN")
                        .font(.system(size: 20))
                        .bold()
                    //line
                    Rectangle()
                        .frame(height: 2)
                        .frame(maxWidth: 90)
                        .foregroundColor(.gray)
                    // Chapther
                    Text("CHAPTER \(String(session?.chapter ?? 0))")
                        .font(.subheadline)
                    // ChapterName
                    Text(" \(session?.chapterName.rawValue ?? "")")
                        .font(.title2)
                        .bold()
                        .multilineTextAlignment(.center)
                }
                .foregroundColor(.black)
                .padding(.top, 40)
                
                            
                // scroll view
                SessionsScreen(
                    sessions: sessions,
                    selectedSessionId: $selectedSessionId
                )



        
            }
        }
  
    }
}

#Preview {
    MyPlanView()
}





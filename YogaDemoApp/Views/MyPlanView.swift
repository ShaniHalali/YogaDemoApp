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
            Image("chapter\(selectedSession?.chapter ?? 1)_bg")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea(edges: .top) 

                Color.gray.opacity(0.2)
                    .ignoresSafeArea(edges: .top)
            VStack{
                ExtractedPlanHeaderView(session: session)
                
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



struct ExtractedUnderLine: View {
    let width: CGFloat
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .frame(maxWidth: width)
            .foregroundColor(.gray)
    }
}

struct ExtractedPlanHeaderView: View {
    @State private var showAlert = false
    @State private var alertMessage = ""
    let session: SessionItem?
    var body: some View {
        VStack(spacing: 40) {
            ZStack(alignment: .leading){
                Button {
                    alertMessage = "information"
                    showAlert = true
                } label: {
                    Image("plan_info")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                }
                .padding(.leading, 60)
                .alert("Info", isPresented: $showAlert) {
                    Button("OK", role: .cancel) {}
                } message: {
                    Text(alertMessage)
                }
                
                
                VStack(spacing: 4) {
                    Text("MY PLAN")
                        .font(.system(size: 20))
                        .bold()
                    //line
                    ExtractedUnderLine(width: 90)
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
                .frame(maxWidth: .infinity)
                
            }
        }
    }
}

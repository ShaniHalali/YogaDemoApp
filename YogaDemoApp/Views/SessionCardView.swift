//
//  SessionCardView.swift
//  YogaDemoApp
//
//  Created by ShaniHalali on 27/12/2025.
//

import SwiftUI

struct SessionCardView: View {
    let session: SessionItem
    let index: Int
    @State private var isDone: Bool
    @Binding var selectedIndex: Int
    let totalSessions: Int

    init(session: SessionItem, index: Int, selectedIndex: Binding<Int> ,totalSessions: Int) {
        self.session = session
        self.index = index
        _isDone = State(initialValue: UserDefaultsManager.isSessionDone(id: session.id))
        self._selectedIndex = selectedIndex
        self.totalSessions = totalSessions
    }

    var body: some View {
        let cardWidth: CGFloat = 280
        VStack(spacing: 12) {

            VStack(spacing: 8) {
                Text("Session \(index+1)")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                ExtractedUnderLine(width: cardWidth)
                
                HStack(spacing: 10) {
                    Image("session_duration")
                    Text("\(session.length) min")
                    //image difficulty
                    Image("intensity_\(session.difficulty.difficultNumber)_dark")
                    Text("\(session.difficulty)")
                }

            }
            .font(.subheadline)
            .foregroundColor(.gray)

            Text("\"\(session.quote)\"")
                .font(.footnote)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
                .foregroundColor(.gray)

            Text(session.quoteAuthor)
                .font(.subheadline)
                .foregroundColor(.gray)


            
            Button(action: {
                UserDefaultsManager.markSessionAsDone(id: session.id)
                isDone = true
                UserDefaultsManager.setLastCompletedSession(id: session.id)
                
                if selectedIndex < totalSessions-1 {
                    withAnimation {
                        selectedIndex += 1
                    }
                }
            }) {
                Text(isDone ? "Completed!" : "Did it")
                    .frame(maxWidth: .infinity)
            }
            
            .padding(.horizontal, 32)
            .padding(.vertical, 10)
            .background(Color.mint)
            .foregroundColor(.white)
            .cornerRadius(20)
        }
        .padding()
        .frame(width: cardWidth, height: 260)
        .background(.white.opacity(0.85))
        .cornerRadius(24)
        .shadow(radius: 5)
    }
}



#Preview {
    //SessionsScreen(sessions: [SessionItem], selectedSessionId: <#T##Binding<String?>#>)
    MyPlanView()
}

//
//  SessionsView.swift
//  YogaDemoApp
//
//  Created by ShaniHalali on 27/12/2025.
//


import SwiftUI

struct SessionsScreen: View {
    
    let sessions: [SessionItem]
    @Binding var selectedSessionId: String?
    @State private var selectedIndex: Int = 0
    
    var body: some View {
        VStack(spacing: 0) {
            cardsCarousel
            numbersCarousel
        }
        .padding(.vertical)
        .onAppear {
            setupInitialSelectedIndex()
        }
    }
}

private extension SessionsScreen {
    var cardsCarousel: some View {
        TabView(selection: $selectedIndex) {
            ForEach(sessions.indices, id: \.self) { index in
                SessionCardView(
                    session: sessions[index],
                    index: index,
                    selectedIndex: $selectedIndex,
                    totalSessions: sessions.count
                )
                .scaleEffect(selectedIndex == index ? 1.0 : 0.92)
                .opacity(selectedIndex == index ? 1.0 : 0.7)
                .tag(index)
                .padding(.horizontal, 24)
            }
        }
        .frame(height: 260)
        .tabViewStyle(.page(indexDisplayMode: .never))
    }
    
    var numbersCarousel: some View {
        ScrollViewReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 12) {
                    ForEach(sessions.indices, id: \.self) { index in
                        let session = sessions[index]
                        let isDone = UserDefaultsManager.isSessionDone(id: session.id)
                        
                        Group {
                            if isDone {
                                Image(systemName: "checkmark")
                            } else {
                                Text("\(index + 1)")
                            }
                        }
                        .font(.headline)
                        .frame(width: 36, height: 36)
                        .background(
                            selectedIndex == index ? Color.black : Color.clear
                        )
                        .foregroundColor(
                            selectedIndex == index ? .white : .gray
                        )
                        .cornerRadius(8)
                        .id(index)
                        .onTapGesture {
                            withAnimation {
                                selectedIndex = index
                            }
                        }
                    }
                }
                .padding(.horizontal)
            }
            .onChange(of: selectedIndex) { _, newValue in
                selectedSessionId = sessions[newValue].id
                withAnimation(.easeInOut) {
                    proxy.scrollTo(newValue, anchor: .center)
                }
            }
        }
    }
    
    
    private func setupInitialSelectedIndex() {
        if let lastCompletedId = UserDefaultsManager.getLastCompletedSession(),
           let index = sessions.firstIndex(where: { $0.id == lastCompletedId }) {
            
            selectedIndex = (index < sessions.count - 1) ? index + 1 : index
        } else {
            selectedIndex = 0
        }
        
        selectedSessionId = sessions[selectedIndex].id
    }
    
}




#Preview {
    MyPlanView()
}



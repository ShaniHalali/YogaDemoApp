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
        VStack(spacing: 50) {
            cardsCarousel
            numbersCarousel
        }
        .padding(.vertical)
        .onAppear {
            setupInitialSelectedIndex()
        }
    }
}

// MARK: - Subviews
private extension SessionsScreen {

    // MARK: Cards Carousel
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

    // MARK: Numbers Carousel
    var numbersCarousel: some View {
        ScrollViewReader { proxy in
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 12) {
                        ForEach(sessions.indices, id: \.self) { index in
                            let session = sessions[index]
                            let isDone = UserDefaultsManager.isSessionDone(id: session.id)

                            Group {
                                if isDone {
                                    Image("scroller_checkmark")
                                } else {
                                    Text("\(index + 1)")
                                        .fontWeight(.bold)
                                }
                            }
                            .font(.headline)
                            .frame(width: 36, height: 36)
                            .background {
                                if selectedIndex == index {
                                    Image("scroller_frame")
                                        .resizable()
                                        .scaledToFit()
                                }
                            }

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
                .frame(height: 56)
            }
            .padding(.vertical, 0)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.black.opacity(0.5))
            )
            .padding(.horizontal)
            .onChange(of: selectedIndex) { _, newValue in
                selectedSessionId = sessions[newValue].id
                withAnimation(.easeInOut) {
                    proxy.scrollTo(newValue, anchor: .center)
                }
            }
        }
    }
}

// MARK: - Helpers
private extension SessionsScreen {

    func setupInitialSelectedIndex() {
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


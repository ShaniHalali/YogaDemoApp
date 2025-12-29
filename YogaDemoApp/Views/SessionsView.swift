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
        VStack(spacing: 24) {
            cardsCarousel
            numbersCarousel
        }
        .padding(.vertical)
        .onAppear {
            selectedIndex = 0
            selectedSessionId = sessions.first?.id
        }
    }
}






private extension SessionsScreen {
    var cardsCarousel: some View {
        TabView(selection: $selectedIndex) {
            ForEach(sessions.indices, id: \.self) { index in
                SessionCardView(session: sessions[index], index: index)
                    .scaleEffect(selectedIndex == index ? 1.0 : 0.92)
                    .opacity(selectedIndex == index ? 1.0 : 0.7)
                    .tag(index)
                    .padding(.horizontal, 24)
            }
        }
        .frame(height: 320)
        .tabViewStyle(.page(indexDisplayMode: .never))
    }


    
    var numbersCarousel: some View {
        ScrollViewReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 12) {
                    ForEach(sessions.indices, id: \.self) { index in
                        Text("\(index + 1)")
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
                print("selected session id: \(selectedSessionId)")
                withAnimation(.easeInOut) {
                    proxy.scrollTo(newValue, anchor: .center)
                }
            }


        }
    }

}

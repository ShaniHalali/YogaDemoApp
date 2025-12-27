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

    var body: some View {
        VStack(spacing: 12) {

            VStack(spacing: 8) {
                Text("Session \(index+1)")
                    .font(.title2)
                    .fontWeight(.bold)
                HStack(spacing: 10) {
                    Image("session_duration")
                    Text("\(session.length) min")
                    // need to fit the image difficulty
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


            
            Button("Did it") {
                print("Did it")
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 10)
            .background(Color.mint)
            .foregroundColor(.white)
            .cornerRadius(20)
        }
        .padding()
        .frame(width: 280, height: 260)
        .background(.ultraThinMaterial)
        .cornerRadius(24)
        .shadow(radius: 5)
    }
}



#Preview {
    SessionsScreen()
}

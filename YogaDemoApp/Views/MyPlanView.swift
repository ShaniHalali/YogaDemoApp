//
//  MyPlanView.swift
//  YogaDemoApp
//
//  Created by ShaniHalali on 27/12/2025.
//

import SwiftUI

struct MyPlanView: View {
    @State private var selectedIndex: Int = 0
    @State private var sessions: [SessionItem] = SessionDataService.loadSessions()

    var body: some View {
        ZStack {
            //background
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
                    Text("CHAPTER 1")
                        .font(.subheadline)
                    // ChapterName
                    Text("Sun Salutation\nVariation")
                        .font(.title2)
                        .bold()
                        .multilineTextAlignment(.center)
                }
                .foregroundColor(.black)
                .padding(.top, 40)
                
                Spacer().frame(height: 10)
                
                // scroll view
                SessionsScreen()


        
            }
        }
  
    }
}

#Preview {
    MyPlanView()
}





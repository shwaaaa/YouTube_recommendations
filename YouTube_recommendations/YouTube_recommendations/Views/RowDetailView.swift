//
//  RowDetailView.swift
//  YouTube_recommendations
//
//  Created by 이승화 on 2023/08/10.
//

import SwiftUI

struct RowDetailView: View {
    @ObservedObject var youtube: Content
    
    var body: some View {
        ZStack {
            Text(youtube.title)
                .frame(width:310, height: 70)
                .background(Color .whitePink)
                .foregroundColor(.mainColor)
                .cornerRadius(15)
                .shadow(color:.subColor, radius: 1, x: 5, y: 5)
            
            Image(systemName: youtube.isBookmark ? "star.fill" : "star")
                    .padding(.leading,-130)
                    .foregroundColor(.mainColor)
        }
    }
}

struct RowDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RowDetailView(youtube: Content(title: "hihi", url: "https://youtu.be/aLSDhmTQ160", description: "크ㅡ크", isBookmark: false))
    }
}

//
//  RowDetailView.swift
//  YouTube_recommendations
//
//  Created by 이승화 on 2023/08/10.
//

import SwiftUI

struct RowDetailView: View {
    var body: some View {
        Text("이거 개웃김ㅋㅋㅋㅋ")
            .frame(width:350, height: 70)
            .background(Color .whitePink)
            .cornerRadius(15)
            .shadow(color: .subColor, radius: 7, x: 5, y: 5)
    }
}

struct RowDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RowDetailView()
    }
}

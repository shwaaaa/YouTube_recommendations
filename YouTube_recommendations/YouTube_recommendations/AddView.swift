//
//  AddView.swift
//  YouTube_recommendations
//
//  Created by 이승화 on 2023/08/10.
//

import SwiftUI

struct AddView: View {
    @State private var title = ""
    @State private var link = ""
    @State private var description = ""
    
    var body: some View {
        VStack {
            Text("Youtube RL")
                .font(.system(size:20,weight: .black))
                .foregroundColor(.mainColor)
                .shadow(color:.mainColor, radius: 8)
                .padding(.top,20)
            
            TextField("제목을 입력해주세요", text: $title)
                .frame(width: 320, height: 60)
                .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke()
                    .foregroundColor(.mainColor)
                    .frame(width: 350, height: 60))
                .padding(.top,30)
            
            TextField("URL을 입력해주세요", text: $link)
                .frame(width: 320, height: 60)
                .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke()
                    .foregroundColor(.mainColor)
                    .frame(width: 350, height: 60))
                .padding(.top,30)
            
            TextEditor(text: $description)
                .frame(width: 320, height: 330)
                .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke()
                    .foregroundColor(.mainColor)
                    .frame(width: 350, height: 330))
                .padding(.top,30)
            
            Text("올리기")
                .frame(width: 280,height: 60)
                .background(Color .mainColor)
                .foregroundColor(.white)
                .bold()
                .cornerRadius(15)
                .padding(.top,30)
           
            Spacer()
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}

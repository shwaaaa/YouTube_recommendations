//
//  AddView.swift
//  YouTube_recommendations
//
//  Created by 이승화 on 2023/08/10.
//

import SwiftUI

struct AddView: View {
    @State var title = ""
    @State var link = ""
    @State var description = ""
    @EnvironmentObject var ListStore: ListStore
    @Environment(\.dismiss) var dismiss
    @State private var checkURL = false
    
    var body: some View {
        VStack {
            Text("Youtube RL")
                .font(.system(size:20,weight: .black))
                .foregroundColor(.mainColor)
                .shadow(color:.mainColor, radius: 8)
                .padding(.top,20)
            
            TextField("제목을 입력해주세요", text: $title)
                .frame(height: 60)
                .padding(4)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke()
                        .foregroundColor(.mainColor)
                        .frame(width: 350, height: 60)
                    )
                    .padding(.top,30)
                    .padding(.horizontal,30)
            
            TextField("URL을 입력해주세요", text: $link)
                .frame(height: 60)
                .padding(4)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke()
                        .foregroundColor(.mainColor)
                        .frame(width: 350, height: 60)
                    )
                    .padding(.top,30)
                    .padding(.horizontal,30)
            
            TextEditor(text: $description)
                .frame(height: 330)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke()
                        .foregroundColor(.mainColor)
                        .frame(width: 350, height: 330)
                    )
                    .padding(.top,30)
                    .padding(.horizontal,30)
            
            Button {
                uploadButtonPressed()
            } label: {
                Text("올리기")
                    .frame(width: 280,height: 60)
                    .background(Color .mainColor)
                    .foregroundColor(.white)
                    .bold()
                    .cornerRadius(15)
                    .padding(.top,30)
            }.alert("", isPresented: $checkURL) {
                Button("Ok") {
                    link = ""
                }
            } message: {
                Text("형식에 맞게 작성해주세요.")
            }

            Spacer()
        }
    }
    
    func uploadButtonPressed() {
        
        if link.count < 23 {
            checkURL = true
        } else if link.count > 22{
            ListStore.addItem(title: title, url: link, description: description)
            dismiss()
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
            .environmentObject(ListStore())
    }
}

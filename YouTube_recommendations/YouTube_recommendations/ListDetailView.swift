//
//  ListDetailView.swift
//  YouTube_recommendations
//
//  Created by 이승화 on 2023/08/10.
//

import SwiftUI

struct ListDetailView: View {
    @State private var isShown = false
    @State var heartNumber = 18
    @State var heartButton = false
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Image("Icon")
                        .resizable()
                        .frame(width:60, height:60)
                    Text("이거 개웃김ㅋㅋㅋㅋ")
                        .font(.headline)
                    Spacer()
                }.padding(.leading)
                
                Rectangle()
                    .frame(width:350,height:0.9)
                    .foregroundColor(.subColor)
                
                Text("예스! 아이 캔 🥹")
                    .frame(width: 350, height: 300)
                
                HStack {
                    VStack {
                        Button {
                            self.heartButton.toggle()
                            if heartButton == true {
                                heartNumber += 1
                            } else if heartButton == false {
                                heartNumber -= 1
                            }
                        } label: {
                            if heartButton == true {
                                Image(systemName: "heart.fill")
                                    .resizable()
                                    .frame(width: 30,height: 30)
                                    .foregroundColor(.subColor)
                            } else if heartButton == false {
                                Image(systemName: "heart")
                                    .resizable()
                                    .frame(width: 30,height: 30)
                                    .foregroundColor(.subColor)
                            }
                        }
                        Text("\(heartNumber)")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    
                    VStack {
                        Image(systemName: "star")
                            .resizable()
                            .frame(width: 35,height: 35)
                            .foregroundColor(.subColor)
                        
                        Text("star")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }.padding(.leading,30)
                    
                    Text("영상 보러가기")
                        .frame(width: 150,height: 50)
                        .background(Color .mainColor)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                        .padding(.leading,30)
                }
                
                Rectangle()
                    .frame(width:350,height:0.9)
                    .foregroundColor(.subColor)
                    .padding(.top)
                
                Text("나도 유튜브 추천할만한 영상이 있다면?")
                    .font(.callout)
                    .padding(.top,50)
                
                Button {
                    self.isShown.toggle()
                } label: {
                    Text("영상 추천하러 가기")
                        .foregroundColor(.mainColor)
                        .font(.system(size:18,weight: .black))
                        .padding(.top,60)
                }.sheet(isPresented: $isShown) {
                    AddView()
                }
                
                Spacer()
            }
        }
    }
}

struct ListDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ListDetailView()
    }
}

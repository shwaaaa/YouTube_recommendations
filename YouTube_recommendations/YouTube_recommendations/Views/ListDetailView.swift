//
//  ListDetailView.swift
//  YouTube_recommendations
//
//  Created by 이승화 on 2023/08/10.
//

import SwiftUI

struct ListDetailView: View {
    @State private var isShown = false
    @State private var isFullScreen = false
    @State var heartNumber = 0
    @State var heartButton = false
//    @State var starButton = false
    @State private var isAnimation = false
    @ObservedObject var youtube: Content
    let timing: Double = 10.0
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Image("Icon")
                        .resizable()
                        .frame(width:60, height:60)
                    Text(youtube.title)
                        .font(.headline)
                    Spacer()
                }.padding(.leading)
                
                Rectangle()
                    .frame(width:350,height:0.9)
                    .foregroundColor(.subColor)
                
                Text(youtube.description)
                    .frame(width: 350, height: 300)
                
                HStack {
                    VStack {
                        Button {
                            self.heartButton.toggle()
                            self.isAnimation.toggle()
                            if heartButton == true {
                                heartNumber += 1
                            } else if heartButton == false {
                                heartNumber -= 1
                            }
                        } label: {
                            Image(systemName: isAnimation ? "heart.fill" : "heart")
                                .resizable()
                                .foregroundColor(isAnimation ? .mainColor : .subColor)
                                .frame(width: 30,height: 30)
                        }
                        Text("\(heartNumber)")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    
                   
                        Button {
                            self.youtube.isBookmark.toggle()
                        } label: {
                            VStack {
                            Image(systemName: youtube.isBookmark ?  "star.fill" : "star")
                                    .resizable()
                                    .frame(width: 35,height: 35)
                                    .foregroundColor(youtube.isBookmark ? .mainColor : .subColor)
                                
                                Text("star")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                        }
                    }.padding(.leading,30)
                    
                    Button {
                        self.isFullScreen.toggle()
                    } label: {
                        Text("영상 보러가기")
                            .frame(width: 150,height: 50)
                            .background(Color .mainColor)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                            .padding(.leading,30)
                    }.sheet(isPresented: $isFullScreen) {
                        MyWebView(urlToLoad: youtube.url)
                    }

                    
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
        ListDetailView(youtube: Content(title: "이거 개웃김ㅋㅋㅋㅋ", url: "https://www.youtube.com/watch?v=aLSDhmTQ160", description: "예스 아이 캔", isBookmark: false))
    }
}

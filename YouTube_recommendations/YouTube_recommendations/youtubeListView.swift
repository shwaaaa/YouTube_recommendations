//
//  ContentView.swift
//  YouTube_recommendations
//
//  Created by 이승화 on 2023/08/10.
//

import SwiftUI

struct YoutubeListView: View {
    @State private var isShown = false
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink {
                    ListDetailView()
                } label: {
                    RowDetailView()
                }
            }.listStyle(.plain)
            
                .toolbar{
                    ToolbarItem(placement: .navigationBarLeading) {
                        Text("Youtube RL")
                            .font(.system(size:25,weight: .black))
                            .foregroundColor(.mainColor)
                            .shadow(color:.mainColor, radius: 8)
                    }
                    
                    ToolbarItem {
                        Button {
                            self.isShown.toggle()
                        } label: {
                            Image(systemName: "plus")
                                .foregroundColor(.mainColor)
                        }.sheet(isPresented: $isShown) {
                            AddView()
                        }
                    }
                }
        }
    }
}

struct YoutubeListView_Previews: PreviewProvider {
    static var previews: some View {
        YoutubeListView()
    }
}

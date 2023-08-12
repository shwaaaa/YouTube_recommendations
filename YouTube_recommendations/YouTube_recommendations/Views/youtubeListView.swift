//
//  ContentView.swift
//  YouTube_recommendations
//
//  Created by 이승화 on 2023/08/10.
//

import SwiftUI

struct YoutubeListView: View {
    @State private var isShown = false
    @State var starOnly = false
    @EnvironmentObject var store: ListStore
    
    var filteredYoutube: [Content] {
        store.list.filter { youtube in
            (!starOnly || youtube.isBookmark)
        }
    }
    
    var body: some View {
        VStack {
            NavigationView {
                List {
                    ForEach(filteredYoutube) { youtube in
                        NavigationLink {
                            ListDetailView(youtube: youtube)
                        } label: {
                            RowDetailView(youtube: youtube)
                        }
                    }.onDelete(perform: deleteItem)
                }.listStyle(.plain)
                
                    .toolbar{
                        ToolbarItem(placement: .navigationBarLeading) {
                            Text("Youtube RL")
                                .font(.system(size:30,weight: .black))
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
                        
                        ToolbarItem(placement: .bottomBar) {
                            Toggle(isOn: $starOnly) {
                                Text("즐겨찾기만 보기")
                                    .foregroundColor(.mainColor)
                            }.toggleStyle(.switch)
                        }
                    }
            }
        }
    }
    func deleteItem(indexSet: IndexSet) {
        store.list.remove(atOffsets: indexSet)
    }
}

struct YoutubeListView_Previews: PreviewProvider {
    static var previews: some View {
        YoutubeListView()
            .environmentObject(ListStore())
    }
}

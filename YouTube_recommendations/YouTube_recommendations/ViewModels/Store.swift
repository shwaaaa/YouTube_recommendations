//
//  Store.swift
//  YouTube_recommendations
//
//  Created by 이승화 on 2023/08/12.
//

import Foundation
import SwiftUI

class ListStore: ObservableObject {
    @Published var list: [Content]
    
    init() {
        list = [
            Content(title: "이거 개웃김ㅋㅋㅋㅋ", url: "https://youtu.be/aLSDhmTQ160", description: "예스 아이 캔", isBookmark: true, isHeart: false, heartNumber: 17),
            Content(title: "😢", url: "https://youtu.be/i9yQ-lmMtJg", description: "개슬프답😭", isBookmark: true, isHeart: false, heartNumber: 4),
            Content(title: "광소마홍보영상", url: "https://youtu.be/FBEBPnWafTk", description: "우와 🅶🆂🅼", isBookmark: false, isHeart: false, heartNumber: 123)
        ]
    }
    
    func deleteItem(indexSet: IndexSet) {
        list.remove(atOffsets: indexSet)
    }
    
    func addItem(title: String, url: String, description: String) {
        let newYoutube = Content(title: title, url: url, description: description, isBookmark: false, isHeart: false, heartNumber: 0)
        list.append(newYoutube)
    }
}

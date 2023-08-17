//
//  Content.swift
//  YouTube_recommendations
//
//  Created by 이승화 on 2023/08/12.
//

import Foundation
import SwiftUI

class Content: ObservableObject, Identifiable {
    @Published var title: String
    @Published var url: String
    @Published var description: String
    @Published var isBookmark: Bool
    @Published var isHeart: Bool
    @Published var heartNumber: Int
    
    let id: UUID
    
    init(title: String, url: String, description: String, isBookmark: Bool, isHeart: Bool, heartNumber: Int) {
        self.title = title
        self.url = url
        self.description = description
        self.isBookmark = isBookmark
        self.isHeart = isHeart
        self.heartNumber = heartNumber
        id = UUID()
    }
}

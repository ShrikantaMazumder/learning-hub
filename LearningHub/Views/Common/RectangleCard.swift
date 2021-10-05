//
//  RectangleCard.swift
//  LearningHub
//
//  Created by Shrikanta Mazumder on 22/8/21.
//

import SwiftUI

struct RectangleCard: View {
    var body: some View {
        Rectangle()
            .frame(height: 48)
            .cornerRadius(10)
            .shadow(radius: 5)
    }
}

struct RectangleCard_Previews: PreviewProvider {
    static var previews: some View {
        RectangleCard()
    }
}

//
//  UserStatView.swift
//  Instagram-Ish
//
//  Created by Cool-Ish on 7/18/23.
//

import SwiftUI

struct UserStatView: View {
    var count: Int
    var label: String
    
    var body: some View {
        VStack(alignment: .center) {
            Text("\(count)")
                .font(.system(size: 15, weight: .semibold))
            
            Text(label)
                .font(.system(size: 15))
        }
        .frame(width: 80, alignment: .center)
    }
}

struct UserStatView_Previews: PreviewProvider {
    static var previews: some View {
        UserStatView(count: 1, label: "Followers")
    }
}

//
//  UserCell.swift
//  Instagram-Ish
//
//  Created by Cool-Ish on 7/18/23.
//

import SwiftUI

struct UserCell: View {
    var userName: String
    var fullName: String
    
    var body: some View {
        HStack {
            Image("batman")
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                Text(userName)
                    .font(.system(size: 14, weight: .semibold))
                
                Text(fullName)
                    .font(.system(size: 14))
            }
            
            Spacer()
        }
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell(userName: "batman", fullName: "Bruce Wayne")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

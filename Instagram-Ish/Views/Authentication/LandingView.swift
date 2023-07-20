//
//  LandingView.swift
//  Instagram-Ish
//
//  Created by Cool-Ish on 7/20/23.
//

import SwiftUI

struct LandingView: View {
    @State var showSignIn: Bool = true
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                if showSignIn {
                    SignInView()
                } else {
                    SignUpView()
                }
                
                Spacer()
                
                Button {
                    showSignIn.toggle()
                } label: {
                    HStack (spacing: 3) {
                        Text("\(showSignIn ? "Don't" : "Already") have an account?")
                        
                        Text("Sign \(showSignIn ? "Up" : "In")")
                            .fontWeight(.bold)
                    }
                    .font(.system(size: 14))
                    .foregroundColor(.white)
                }
            }
            .padding([.horizontal, .bottom], 32)
        }
    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
    }
}

//
//  SideMenu.swift
//  temporizador
//
//  Created by Angel Contreras Medina on 20/07/23.
//

import SwiftUI

struct SideMenu: View {
    let width: CGFloat
    let menuOpen: Bool
    let toggleMenu: () -> Void
    let toggleProfile: () -> Void
    let toggleConfig: () -> Void
    var body: some View {
        ZStack {
            GeometryReader { _ in
                EmptyView()
                
            }
            .background(Color.gray.opacity(0.4))
            .animation(Animation.easeIn.delay(0.25))
            .opacity(self.menuOpen ? 1 : 0)
            .onTapGesture {
                self.toggleMenu()
            }
            
            HStack {
                Spacer()
                
                MenuContent(width: width, toggleMenu: toggleMenu, toggleProfile: toggleProfile, toggleConfig: toggleConfig)
                    .frame(width: width)
                    .offset(x: menuOpen ?  0 : width,y: 80)
                    .animation(.default)
                
               
            }
            
        }
    }
}

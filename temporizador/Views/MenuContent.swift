//
//  MenuContent.swift
//  temporizador
//
//  Created by Angel Contreras Medina on 20/07/23.
//

import SwiftUI

struct MenuContent: View {
    let width: CGFloat
    let toggleMenu: () -> Void
    let toggleProfile: () -> Void
    let toggleConfig: () -> Void
   
    var items: [MenuItem] = [
        MenuItem(text:"Configuración", imageName: "gearshape.fill"),
        MenuItem(text:"Comentarios", imageName: "doc.plaintext"),
    ]
    var body: some View {
        ZStack {
            Color.orange
            
            VStack {
                    Image(systemName: "line.3.horizontal")
                        .resizable()
                        .foregroundColor(Color.white)
                        .frame(width:width,height: 40)
                    
                
                    VStack {
                        Spacer()
                        HStack {
                            
                            Image(systemName: items[0].imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .foregroundColor(.gray)
                                .frame(width: 32,height: 32, alignment: .center)
                            
                            Text(items[0].text)
                                .foregroundColor(Color.black)
                                .bold()
                                .font(.system(size: 22))
                                .multilineTextAlignment(.leading)
                            
                            Spacer()
                            
                                
                        }
                        .padding()
                        .onTapGesture {
                            self.toggleMenu()
                            self.toggleConfig()
                            
                        }
                        
                        Spacer()
                    }
                
                    VStack {
                    Spacer()
                        HStack {
                            
                            Image(systemName: items[1].imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .foregroundColor(.gray)
                                .frame(width: 32,height: 32, alignment: .center)
                            
                            Text(items[1].text)
                                .foregroundColor(Color.black)
                                .bold()
                                .font(.system(size: 22))
                                .multilineTextAlignment(.leading)
                            
                            Spacer()
                            
                                
                        }
                        .padding()
                        .onTapGesture {
                            self.toggleMenu()
                            self.toggleProfile()
                            
                        }
                    
                    Spacer()
                }
                
                
                Spacer()
            }
        }
        
    }
}

//
//  Profile.swift
//  temporizador
//
//  Created by Angel Contreras Medina on 14/07/23.
//

import SwiftUI

struct Profile: View {
    let toggleProfile: () -> Void
    
    var body: some View {
        
        
                
        ZStack {
            Color.orange
            
            ScrollView {
                VStack {
                            Image(systemName: "globe")
                                .resizable()
                                .frame(width: 150,height: 150)
                                .padding(EdgeInsets(top: 120, leading: 0, bottom: 90, trailing: 0))
                    
                    
                    HStack {
                        Text("Nombre:")
                            .font(.system(size: 40))
                            .foregroundColor(.black)
                            .padding(EdgeInsets(top: 0, leading: 30, bottom: 5, trailing: 0))
                        
                        
                        Spacer()
                    }
                    
                    HStack {
                        Text("Angel Contreras Medina")
                            .font(.system(size: 25))
                            .foregroundColor(.black)
                            .padding(EdgeInsets(top: 0, leading: 50, bottom: 5, trailing: 0))
                        
                        
                        Spacer()
                    }
                    
                    HStack {
                        Text("Comentarios: ")
                            .font(.system(size: 40))
                            .foregroundColor(.black)
                            .padding(EdgeInsets(top: 0, leading: 30, bottom: 5, trailing: 0))
                        
                        
                        Spacer()
                    }
                    
                    HStack {
                        Text("La aplicación fue algo sencilla, lamentablemente estuve bastante ocupado y la realice en los ultimos 3 dias antes de la fecha final de entrega, lo mas complicado fue iniciar el temporizador al poner el iphone en una mesa ya que no habia relizado algun proyecto anterior con ese tipo de implementaciones.")
                            
                            .font(.system(size: 20))
                            .foregroundColor(.black)
                            .padding(EdgeInsets(top: 0, leading: 50, bottom: 0, trailing: 20))
                        
                        
                        Spacer()
                    }
                    
                            Spacer()
                        }
                
                            
                .foregroundColor(.black)
            }
            VStack {
                HStack {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 55, height: 40)
                        .padding(EdgeInsets(top: 70, leading: 20, bottom: 0, trailing: 0))
                        .onTapGesture {
                        self.toggleProfile()
                    }
                    
                    Spacer()
                }
                Spacer()
            }
            .foregroundColor(.black)
        }
        .ignoresSafeArea()
        
            
    }
}



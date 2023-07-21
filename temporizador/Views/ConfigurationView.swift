//
//  ConfigurationView.swift
//  temporizador
//
//  Created by Angel Contreras Medina on 20/07/23.
//

import SwiftUI

struct ConfigurationView: View {
    @Binding  var checked1: Bool
    @Binding  var checked2: Bool
    @Binding  var checked3: Bool
    @Binding  var sound1: Bool
    @Binding  var sound2: Bool
    @Binding  var vibration1: Bool
    @Binding  var vibration2: Bool
    let toggleConfig: () -> Void
    
    var body: some View {
        ZStack {
            Color.orange
            
            VStack {
                HStack {
                    Image(systemName: "arrow.left")
                        .resizable()
                    .frame(width: 55, height: 40)
                    .padding(EdgeInsets(top: 70, leading: 20, bottom: 0, trailing: 0))
                    .onTapGesture {
                        self.toggleConfig()
                    }
                    
                    Spacer()
                }
                
                HStack {
                    Image(systemName: checked1 ? "checkmark" : "square")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(checked1 ? Color.black : Color.white)
                        .background(Color.white, in: RoundedRectangle(cornerRadius: 5))
                        .onTapGesture {
                            self.checked1.toggle()
                            self.checked2 = false
                            self.checked3 = false
                        }
                        
                    
                    Text("Vibración y Sonido")
                        .bold()
                        .font(.system(size: 30))
                        .padding()
                    
                    Spacer()
                    
                }.padding(EdgeInsets(top: 50, leading: 20, bottom: 0, trailing: 0))
                
                HStack {
                    Image(systemName: checked2 ? "checkmark" : "square")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(checked2 ? Color.black : Color.white)
                        .background(Color.white, in: RoundedRectangle(cornerRadius: 5))
                        .onTapGesture {
                            self.checked2.toggle()
                            self.checked1 = false
                            self.checked3 = false
                        }
                    
                    Text("Sólo Sonido")
                        .bold()
                        .font(.system(size: 30))
                        .padding()
                    
                    Spacer()
                    
                }.padding(EdgeInsets(top: 30, leading: 20, bottom: 0, trailing: 0))
                
                HStack {
                    Image(systemName: checked3 ? "checkmark" : "square")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(checked3 ? Color.black : Color.white)
                        .background(Color.white, in: RoundedRectangle(cornerRadius: 5))
                        .onTapGesture {
                            self.checked3.toggle()
                            self.checked2 = false
                            self.checked1 = false
                        }
                    
                    Text("Sólo Vibración")
                        .bold()
                        .font(.system(size: 30))
                        .padding()
                    
                    Spacer()
                    
                }.padding(EdgeInsets(top: 30, leading: 20, bottom: 0, trailing: 0))
                
                HStack {
                    
                    Text("Sonidos: ")
                        .bold()
                        .font(.system(size: 30))
                        .padding()
                    
                    VStack {
                        Button(action: {
                            sound1.toggle()
                            self.sound2 = false
                        }){
                            Text("Sonido 1")
                                .tint(.black)
                                .bold()
                                .font(.system(size: 20))
                                
                            
                        }
                            .frame(width: 110, height: 40)
                        .background( sound1 ? Color.yellow : Color.white, in: RoundedRectangle(cornerRadius: 10))
                        
                        Button(action: {
                            sound2.toggle()
                            self.sound1 = false
                        }){
                            Text("Sonido 2")
                                .tint(.black)
                                .bold()
                                .font(.system(size: 20))
                                
                            
                        }
                            .frame(width: 110, height: 40)
                            .background( sound2 ? Color.yellow : Color.white, in: RoundedRectangle(cornerRadius: 10))
                    }

                    
                    
                    
                    Spacer()
                    
                }.padding(EdgeInsets(top: 30, leading: 40, bottom: 0, trailing: 0))
                
                HStack {
                    
                    Text("Vibración: ")
                        .bold()
                        .font(.system(size: 30))
                        .padding()
                    
                    VStack {
                        Button(action: {
                            vibration1.toggle()
                            self.vibration2 = false
                        }){
                            Text("Vibración 1")
                                .tint(.black)
                                .bold()
                                .font(.system(size: 20))
                                
                            
                        }
                            .frame(width: 110, height: 40)
                        .background( vibration1 ? Color.yellow : Color.white, in: RoundedRectangle(cornerRadius: 10))
                        
                        Button(action: {
                            vibration2.toggle()
                            self.vibration1 = false
                        }){
                            Text("Vibración 2")
                                .tint(.black)
                                .bold()
                                .font(.system(size: 20))
                                
                            
                        }
                            .frame(width: 110, height: 40)
                            .background( vibration2 ? Color.yellow : Color.white, in: RoundedRectangle(cornerRadius: 10))
                            
                    }

                    
                    
                    
                    Spacer()
                    
                }.padding(EdgeInsets(top: 30, leading: 20, bottom: 0, trailing: 0))
                
                
                
                Spacer()
            }
            .foregroundColor(.black)
        }
        .ignoresSafeArea()
    }
}

struct ConfigurationView_Previews: PreviewProvider {
    struct ConfigurationViewHolder: View{
       
        
        @State var checked1 = false
        @State var checked2 = false
        @State var checked3 = false
        @State var sound1 = false
        @State var sound2 = false
        @State var vibration1 = false
        @State var vibration2 = false
        func toggleProfile() {
            return
        }
        var body: some View {
            ConfigurationView(checked1: $checked1, checked2: $checked2, checked3: $checked3,  sound1: $sound1, sound2: $sound2, vibration1: $vibration1, vibration2: $vibration2,toggleConfig: toggleProfile)
        }
    }
       static var previews: some View {
           ConfigurationViewHolder()
        
    }
}

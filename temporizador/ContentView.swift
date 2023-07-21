//
//  ContentView.swift
//  temporizador
//
//  Created by Angel Contreras Medina on 14/07/23.
//

import SwiftUI
import AudioToolbox


struct ContentView: View {
    @State var menuOpen = false
    @State var profileOpen = false
    @State var configOpen = false
    @State var checked1 = false //vibración y sonido
    @State var checked2 = false // sólo sonido
    @State var checked3 = false // sólo vibración
    @State var sound1 = false
    @State var sound2 = false
    @State var vibration1 = false
    @State var vibration2 = false
    @State var timerActive = false
    @State var isDeviceOnTable = false
    @StateObject private var vm = ViewModel()
    @StateObject private var motionManager = MotionManager()
    private let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    private let width: Double = 280
    
    func toggleMenu() {
        menuOpen.toggle()
    }
    
    func toggleProfile() {
        profileOpen.toggle()
        
       
    }
    
    func toggleConfig() {
        configOpen.toggle()
    }
    
    var body: some View {
        
        
        if !profileOpen && !configOpen {
            ZStack {
                VStack {
                            HStack {
                                Spacer()
                                Image(systemName: "line.3.horizontal")
                                    .resizable()
                                    .frame(width: 50,height: 40)
                                    .padding(EdgeInsets(top: 80, leading: 0, bottom: 80, trailing: 0))
                                    .onTapGesture {
                                        self.menuOpen.toggle()
                                    }
                                    .disabled(timerActive)
                                    
                            }
                                
                            
                            Text("\(vm.time)")
                                .font(.system(size: 55, weight: .medium, design: .rounded))
                                .padding()
                                .frame(width: width)
                                .background(.thinMaterial)
                                .cornerRadius(20)
                                .overlay(RoundedRectangle(cornerRadius: 20) .stroke(Color.gray, lineWidth: 4))
                                .onChange(of: vm.endTimer) { newValue in
                                    if newValue {
                                        let impactFeedback = UIImpactFeedbackGenerator(style: vibration1 ? .medium : .heavy)
                                        var soundPlayer = SoundPlayer(name: sound1 ? "1" : "2")
                                        
                                        if checked1{
                                            impactFeedback.impactOccurred(intensity: 10)
                                            soundPlayer.play()
                                            
                                        } else if checked2 {
                                            
                                            soundPlayer.play()
                                            
                                        } else if checked3 {
                                            for _ in 1...10 {
                                               impactFeedback.impactOccurred(intensity: 10)
                                            }
                                            
                                        }
                                        
                                    }
                                }
                                .onChange(of: motionManager.isDeviceOnTable) {newValue in
                                    
                                        self.isDeviceOnTable = newValue
                                   
                                }
                                .onChange(of: isDeviceOnTable){ new in
                                    if new && timerActive && vm.initialState {
                                        vm.start(minutes: vm.minutes)
                                        
                                    }
                                }
                    Spacer()
                       //botones aceptar - cancelar
                        VStack{
                            if !vm.initialState && !vm.endTimer {
                                Button(action: {
                                                    vm.start(minutes: vm.minutes)
                                   
                                    
                                               
                                            }){
                                                
                                                Text("\(vm.labelButton)").font(.system(size: 30))
                                            }
                                            .tint(.white)
                                            .frame(width: 250, height: 100)
                                            .background(Color .orange, in: RoundedRectangle(cornerRadius: 50))
                                            .onTapGesture {
                                                    vm.start(minutes: vm.minutes)
                                               
                                        }
                                            .padding()
                            }else if timerActive && vm.initialState {
                                Text("Configurado")
                                    .bold()
                                    .font(.system(size: 30))
                                Text("Esperando para iniciar...")
                                    .bold()
                                    .font(.system(size: 30))
                            }
                            
                                    
                                    
                                    
                                    
                                Button(action: {
                                    vm.reset()
                                    self.timerActive.toggle()
                                    if timerActive && isDeviceOnTable && vm.initialState {
                                        vm.start(minutes: vm.minutes)
                                    }
 
                                }){
                                    Text(timerActive ? "Cancelar" : "Aceptar").font(.system(size: 30))
                                        }
                                        .tint(.white)
                                            .frame(width: 250, height: 100)
                                            .background(timerActive ? Color.red : Color.orange, in: RoundedRectangle(cornerRadius: 50))
                                            .onTapGesture {
                                                vm.reset()
                                                self.timerActive.toggle()
                                                
                                            }.padding()
                          
                                    
                                }
                        .padding(EdgeInsets(top: 40, leading: 0, bottom: 0, trailing: 0))
                        
                
                            
                            Spacer()
                            
                                
                                
                           
                    
                        }
                        
                
                SideMenu(width: UIScreen.main.bounds.width/1.7, menuOpen: menuOpen, toggleMenu: toggleMenu, toggleProfile: toggleProfile, toggleConfig: toggleConfig)
                
            }.ignoresSafeArea()
                .onReceive(timer) { _ in
                    vm.updateCountdown()
                        
                    
            }
        }
            
        if profileOpen { Profile(toggleProfile: toggleProfile) }
        
        if configOpen { ConfigurationView(checked1: $checked1, checked2: $checked2, checked3: $checked3,sound1: $sound1, sound2: $sound2, vibration1: $vibration1, vibration2: $vibration2, toggleConfig: toggleConfig)}
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}

//
//  ContentView.swift
//  SimpleSoundPlayerDemo
//
//  Created by raku-pro on 2021/09/30.
//  Copyright 2021 raku-pro

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var playerModel: SoundPlayerModel
    @State var isTapped: Bool = false
    @State var note: String = "60"
    @State var program: String = "0"
    
    var body: some View {
        VStack {
            Text("音を出す")
                .padding(4)
                .border(Color.black, width: 1)
                .simultaneousGesture(DragGesture(minimumDistance: 0).onChanged({ value in
                guard !isTapped else {
                    return
                }
                    isTapped = true
            }).onEnded({ _ in
                isTapped = false
            }))

            VStack(alignment: .leading, spacing: 0) {
                Text("MIDI Note(0~127)")
                HStack {
                    TextField("Note Num", text: $note)
                        .textFieldStyle(.roundedBorder)
                    UpDownButton(value: $note)
                }
            }.padding()
            
            VStack(alignment: .leading, spacing: 0) {
                Text("Program(音色) 0~")
                HStack {
                    TextField("Program", text: $program)
                        .textFieldStyle(.roundedBorder)
                    UpDownButton(value: $program)
                }
            }.padding()
            
        }.onChange(of: isTapped) { newValue in
            if let num = Int(note) {
                let num8 = UInt8(num)
                isTapped ?
                    playerModel.player.startNote(num8, velocity: 60) :
                    playerModel.player.stopNote(num8)
            }
        }.onChange(of: program) { newValue in
            if let num = Int(newValue) {
                try! playerModel.player.prepare(program: UInt8(num))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject({ () -> SoundPlayerModel in
            let model = SoundPlayerModel()
            model.prepare()
            return model
        }())
    }
}

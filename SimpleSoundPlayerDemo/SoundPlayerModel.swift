//
//  SoundPlayerModel.swift
//  SimpleSoundPlayerDemo
//
//  Created by raku-pro on 2021/09/30.
//  Copyright 2021 raku-pro


import SwiftUI
import SimpleSoundPlayer

class SoundPlayerModel: ObservableObject {
    
    var player: SimpleSoundPlayer!
    
    init() {
    }
    
    func prepare() {
        guard let url = Bundle.main.url(forResource: "GeneralUser GS v1.471", withExtension: "sf2") else {
            fatalError("failed to load soundfont")
        }
        self.player = SimpleSoundPlayer(soundBankURL: url)
        try! self.player.prepare()
    }
    
}

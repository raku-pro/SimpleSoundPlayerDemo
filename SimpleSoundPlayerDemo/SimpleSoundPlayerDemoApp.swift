//
//  SimpleSoundPlayerDemoApp.swift
//  SimpleSoundPlayerDemo
//
//  Created by raku-pro on 2021/09/30.
//  Copyright 2021 raku-pro

import SwiftUI

@main
struct SimpleSoundPlayerDemoApp: App {
    @StateObject var soundPlayerModel = { () -> SoundPlayerModel in
        let model = SoundPlayerModel()
        model.prepare()
        return model
    }()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(soundPlayerModel)
        }
    }
}

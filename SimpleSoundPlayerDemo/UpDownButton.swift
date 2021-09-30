//
//  UpDownButton.swift
//  SimpleSoundPlayerDemo
//
//  Created by raku-pro on 2021/09/30.
//  Copyright 2021 raku-pro

import SwiftUI

struct UpDownButton: View {
    @Binding var value: String
    
    var body: some View {
        HStack {
            CountButton(buttonType: .decrease, value: $value)
            CountButton(buttonType: .increase, value: $value)
        }
    }
}

struct UpDownButton_Previews: PreviewProvider {
    static var previews: some View {
        UpDownButton(value: Binding.constant("0"))
    }
}

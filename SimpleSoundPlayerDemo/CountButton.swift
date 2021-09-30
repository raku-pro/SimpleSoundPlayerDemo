//
//  CountButton.swift
//  SimpleSoundPlayerDemo
//
//  Created by raku-pro on 2021/09/30.
//  Copyright 2021 raku-pro
import SwiftUI

struct CountButton: View {
    enum ButtonType {
        case decrease, increase
        
        var string: String {
            switch self {
            case .increase:
                return "+"
            case .decrease:
                return "-"
            }
        }
    }
    var buttonType: ButtonType = .increase
    @Binding var value: String
    
    var body: some View {
        
        Button(buttonType.string) {
            guard let intValue = Int(value) else {
                return
            }
            let newValue = (buttonType == .increase ? intValue + 1 : intValue - 1)
            self.value = "\(newValue)"
        }
        
    }
}

struct CountButton_Previews: PreviewProvider {
    static var previews: some View {
        CountButton(value: Binding.constant("0"))
    }
}

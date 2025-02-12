//
//  AFButton.swift
//  Apple-Frameworks
//
//  Created by AMTK on 2025/02/12.
//

import SwiftUI

struct AFButton: View {
    
    let title: String
    
    var body: some View {
        Text(title)
            .font(.title2)
            .fontWeight(.semibold)
            .frame(width: 200, height: 50)
            .background(.cyan)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}

struct AFButton_Previews: PreviewProvider {
    static var previews: some View {
        AFButton(title: "AFButton")
    }
}

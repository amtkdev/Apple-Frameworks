//
//  FrameworkGridViewModel.swift
//  Apple-Frameworks
//
//  Created by AMTK on 2025/02/12.
//

import Foundation

final class FrameworkGridViewModel: ObservableObject {
    var selectedFramework: Framework? {
        didSet {
            isShowingDetailView = true
        }
    }
    
    @Published var isShowingDetailView = false
}

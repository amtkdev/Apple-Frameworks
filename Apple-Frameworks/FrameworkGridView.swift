//
//  FrameworkGridView.swift
//  Apple-Frameworks
//
//  Created by AMTK on 2025/02/11.
//

import SwiftUI

struct FrameworkGridView: View {
    
    @StateObject var viewModel = FrameworkGridViewModel()
    
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible())]
    
    var body: some View {
        ZStack {
//            BackgroundView()
//            Text(" Apple Framework") 2:32:34
            NavigationView{
                ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(MockData.frameworks) { framework in
                            FrameworkTitleView(framework: framework)
                                .onTapGesture {
                                    viewModel.selectedFramework = framework
                                }
                        }
                    }
                }
                .navigationTitle(" Apple Framework")
                .sheet(isPresented: $viewModel.isShowingDetailView) {
                    FrameworkDetailView(framework: viewModel.selectedFramework ?? MockData.sampleFramework, isShowingDetailView: $viewModel.isShowingDetailView)
                }
            }
        }
    }
}

struct FrameworkGridView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkGridView()
            .preferredColorScheme(.dark)
    }
}

struct BackgroundView: View {
    var body: some View {
        LinearGradient(gradient: Gradient(colors:[.white, .mint]),
                       startPoint: .topLeading,
                       endPoint: .bottomLeading)
        .ignoresSafeArea()
    }
}

struct FrameworkTitleView: View {
    
    let framework: Framework
    
    var body: some View {
        VStack {
            Image(framework.imageName)
                .resizable()
                .frame(width: 90, height: 90)
            Text(framework.name)
                .font(.title2)
                .fontWeight(.semibold)
                .scaledToFit()
                .minimumScaleFactor(0.6)
        }
        .padding()
    }
}

//
//  MainView.swift
//  CamCatcherUI
//
//  Created by Daniel Cazorro Frias  on 27/2/24.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var viewModel: MainViewModel
    
    var body: some View {
        NavigationView{
            List(viewModel.images, id: \.self) { image in
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
            }
            .navigationTitle("Pictures")
            .navigationBarItems(trailing:
                                    Button(action : {
                viewModel.presentImagePcier()
            }) {
                Image(systemName: "plus")
            }
            )
        }
    }
}

#Preview {
    MainView(viewModel: MainViewModel())
}

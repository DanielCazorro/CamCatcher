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
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button(action : {
                        viewModel.presentImagePicker()
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $viewModel.showImagePicker) {
                // Aquí se presenta la hoja de presentación que contiene el selector de imágenes
                if let coordinator = viewModel.imagePickerCoordinator {
                    ImagePickerCoordinatorView(imagePickerCoordinator: coordinator)
                }
            }
        }
    }
}

#Preview {
    MainView(viewModel: MainViewModel())
}

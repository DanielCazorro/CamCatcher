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
                    .aspectRatio(contentMode: .fill)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 80, maxHeight: 80) // Ocupa todo el espacio disponible
                    .clipped() // Recorta la imagen para que no se extienda más allá de la celda
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .padding(5)
                    .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
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

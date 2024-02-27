//
//  MainView.swift
//  CamCatcherUI
//
//  Created by Daniel Cazorro Frias  on 27/2/24.
//

import SwiftUI

struct MainView: View {
    
    // Properties
    @ObservedObject var viewModel: MainViewModel
    @State private var showImagePicker = false
    
    // Body
    var body: some View {
        NavigationView{
            List(viewModel.images, id: \.self) { image in
                // NavigationLink para mostrar la vista de detalle al hacer clic en una imagen de la lista
                NavigationLink(destination: DetailView(image: image)) {
                    // Mostrar la imagen en la celda de la lista
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 80, maxHeight: 80)
                        .clipped() // Recorta la imagen para que no se extienda más allá de la celda
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .padding(5)
                        .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                }
            }
            .navigationTitle("CamCatcherUI") // Título de la barra de navegación
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    // Botón para abrir el selector de imágenes
                    Button(action : {
                        showImagePicker = true
                    }) {
                        Image(systemName: "plus") // Icono de más para añadir imágenes
                    }
                }
            }
            .actionSheet(isPresented: $showImagePicker) {
                // Hoja de acción para elegir entre seleccionar una foto de la galería o tomar una foto con la cámara
                ActionSheet(
                    title: Text("Seleccionar imagen"),
                    buttons: [
                        .default(Text("Seleccionar foto de Galería")) {
                            viewModel.presentImagePicker(sourceType: .photoLibrary) // Acción para seleccionar una foto de la galería
                        },
                        .default(Text("Tomar foto")) {
                            viewModel.presentImagePicker(sourceType: .camera) // Acción para tomar una foto con la cámara
                        },
                        .cancel() // Botón para cancelar la acción y cerrar la hoja de acción
                    ]
                )
            }
            .sheet(isPresented: $viewModel.showImagePicker) {
                // Hoja de presentación que contiene el selector de imágenes
                if let coordinator = viewModel.imagePickerCoordinator {
                    ImagePickerCoordinatorView(imagePickerCoordinator: coordinator) // Mostrar el selector de imágenes
                }
            }
        }
    }
}

#Preview {
    MainView(viewModel: MainViewModel())
}

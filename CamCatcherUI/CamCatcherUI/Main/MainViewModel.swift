//
//  MainViewModel.swift
//  CamCatcherUI
//
//  Created by Daniel Cazorro Frias  on 27/2/24.
//

import SwiftUI
import Photos

class MainViewModel: ObservableObject {
    // Array para almacenar las imágenes
    @Published var images: [UIImage] = []
    
    // Función para presentar el selector de imágenes
    func presentImagePicker() {
        // Código para presentar el selector de imágenes
    }
}

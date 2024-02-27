//
//  MainViewModel.swift
//  CamCatcherUI
//
//  Created by Daniel Cazorro Frias  on 27/2/24.
//

import SwiftUI
import Photos

final class MainViewModel: ObservableObject {
    // Array para almacenar las imágenes
    @Published var images: [UIImage] = []
    
    // Booleano para controlar la presentación del selector de imágenes
    @Published var showImagePicker: Bool = false
    
    // Coordinator para el UIImagePickerController
    var imagePickerCoordinator: ImagePickerCoordinator?
    
    // Método para alternar el valor de showImagePicker
    func toggleImagePicker() {
        self.showImagePicker.toggle()
    }
    
    // Función para presentar el selector de imágenes
    func presentImagePicker() {
        // Asignar una nueva instancia de ImagePickerCoordinator a imagePickerCoordinator
        imagePickerCoordinator = ImagePickerCoordinator(self)
        
        // Cambiar el valor de showImagePicker para mostrar la hoja de presentación
        toggleImagePicker()
    }
}

class ImagePickerCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    var parent: MainViewModel
    
    init(_ parent: MainViewModel) {
        self.parent = parent
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            parent.images.append(pickedImage)
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

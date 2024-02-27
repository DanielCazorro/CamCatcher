//
//  MainViewModel.swift
//  CamCatcherUI
//
//  Created by Daniel Cazorro Frias  on 27/2/24.
//

import SwiftUI
import Photos

final class MainViewModel: NSObject, ObservableObject {
    // Array para almacenar las imágenes
    @Published var images: [UIImage] = []
    
    // Booleano para controlar la presentación del selector de imágenes
    @Published var showImagePicker: Bool = false
    
    // Coordinator para el UIImagePickerController
    var imagePickerCoordinator: ImagePickerCoordinator?

    // Método para alternar el valor de showImagePicker
    func toggleImagePicker() {
        self.showImagePicker.toggle()
        print("Show image picker: \(self.showImagePicker ? "true" : "false")")
    }
    
    // Función para presentar el selector de imágenes
    func presentImagePicker(sourceType: UIImagePickerController.SourceType) {
        // Asignar una nueva instancia de ImagePickerCoordinator a imagePickerCoordinator
        imagePickerCoordinator = ImagePickerCoordinator(self)

        // Configurar el sourceType en el coordinador
        if sourceType == .camera {
            // Si es la cámara, comprobamos si está disponible y configuramos el sourceType en consecuencia
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                imagePickerCoordinator?.sourceType = .camera
            } else {
                // Si la cámara no está disponible, mostramos un mensaje o tomamos alguna acción alternativa
                print("La cámara no está disponible en este dispositivo.")
                return
            }
        } else {
            // Si no es la cámara, asumimos que es la galería de fotos
            imagePickerCoordinator?.sourceType = .photoLibrary
        }
        
        // Configurar el valor de showImagePicker para mostrar la hoja de presentación
        toggleImagePicker()
    }
}


class ImagePickerCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    var parent: MainViewModel
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    init(_ parent: MainViewModel) {
        self.parent = parent
        print("Image Picker Coordinator initialized")
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

extension MainViewModel: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            images.append(pickedImage)
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

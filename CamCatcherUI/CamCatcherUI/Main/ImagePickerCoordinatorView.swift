//
//  ImagePickerCoordinatorView.swift
//  CamCatcherUI
//
//  Created by Daniel Cazorro Frias  on 27/2/24.
//

import SwiftUI

struct ImagePickerCoordinatorView: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIImagePickerController
    var imagePickerCoordinator: ImagePickerCoordinator
    
    /// Esta función crea y devuelve un UIImagePickerController
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        // Asigna el coordinador como el delegado del UIImagePickerController
        picker.delegate = imagePickerCoordinator
        // Configura el sourceType del UIImagePickerController con el sourceType del coordinador
        picker.sourceType = imagePickerCoordinator.sourceType
        return picker
    }
    /// Esta función no hace nada porque no necesitamos actualizar la vista del controlador
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
}

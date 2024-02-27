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
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = imagePickerCoordinator
        picker.sourceType = imagePickerCoordinator.sourceType 
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
}

//
//  MainViewModel.swift
//  CamCatcher
//
//  Created by Daniel Cazorro Frias  on 26/2/24.
//

import UIKit

class MainViewModel {
    
    // MARK: - Properties
    private var dataManager: MainViewDataManager
    // Propiedad para almacenar las imágenes seleccionadas o tomadas
    var images: [UIImage?] = []
    
    // MARK: - Init
    init(dataManager: MainViewDataManager) {
        self.dataManager = dataManager
    }
    
    // MARK: - Methods
    
    /// Presenta el selector de imágenes para elegir desde la galería o tomar una foto con la cámara.
    func presentImagePicker(from viewController: UIViewController) {
        let alertController = UIAlertController(title: "Añadir imagen a la tabla", message: "Elija una opción", preferredStyle: .actionSheet)
        
        let galleryAction = UIAlertAction(title: "Seleccionar de la galería", style: .default) { _ in
            self.showImagePicker(sourceType: .photoLibrary, from: viewController)
        }
        
        let cameraAction = UIAlertAction(title: "Tomar foto", style: .default) { _ in
            self.showImagePicker(sourceType: .camera, from: viewController)
        }
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        
        alertController.addAction(galleryAction)
        alertController.addAction(cameraAction)
        alertController.addAction(cancelAction)
        
        viewController.present(alertController, animated: true, completion: nil)
    }
    
    /// Muestra el selector de imágenes con el tipo de fuente especificado.
    private func showImagePicker(sourceType: UIImagePickerController.SourceType, from viewController: UIViewController) {
        if UIImagePickerController.isSourceTypeAvailable(sourceType) {
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = sourceType
            imagePicker.delegate = viewController as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
            viewController.present(imagePicker, animated: true, completion: nil)
        } else {
            print("La fuente seleccionada no está disponible.")
        }
    }
    
    /// Agrega una nueva imagen al arreglo de imágenes.
    func addImage(_ image: UIImage?) {
        if let image = image {
            images.append(image)
            print("Imagen agregada al viewModel:", image)
        } else {
            print("Intento de agregar una imagen nula al viewModel.")
        }
    }
}

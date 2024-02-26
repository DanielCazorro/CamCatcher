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
    
    // Método para agregar una nueva imagen a la lista de imágenes
    func addImage(_ image: UIImage?) {
        if let image = image {
            print("Imagen agregada al viewModel:", image)
            images.append(image)
        } else {
            print("Intento de agregar una imagen nula al viewModel.")
        }
    }
    
}

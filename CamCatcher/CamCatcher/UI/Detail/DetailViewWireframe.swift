//
//  DetailViewWireframe.swift
//  CamCatcher
//
//  Created by Daniel Cazorro Frias  on 26/2/24.
//

import UIKit

class DetailViewWireframe {
    
    // MARK: - Properties
    var viewController: DetailViewController {
        // Generating module components
        
        // Creamos una instancia de DetailViewController
        let viewController: DetailViewController = DetailViewController(nibName: nil, bundle: nil)
        
        // Creamos una instancia de DetailViewModel
        let viewModel: DetailViewModel = DetailViewModel()
        
        // Configuramos el viewModel en el viewController
        viewController.set(viewModel: viewModel)
        
        // Retornamos el viewController
        return viewController
    }
    
    // MARK: - Public Methods
    
    /// Función genérica para navegar a otro ViewController
    func push(navigation: UINavigationController?) {
        guard let navigation = navigation else { return }
        navigation.pushViewController(viewController, animated: true)
    }
}

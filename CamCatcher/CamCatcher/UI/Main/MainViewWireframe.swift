//
//  MainViewWireframe.swift
//  CamCatcher
//
//  Created by Daniel Cazorro Frias  on 26/2/24.
//

import UIKit

class MainViewWireframe {
    
    // MARK: - Properties
    var viewController: MainViewController {
        // Generating module components
        
        // Creamos una instancia de MainViewController
        let viewController: MainViewController = MainViewController(nibName: nil, bundle: nil)
        
        // Creamos una instancia de MainViewDataManager que se encargará de manejar los datos
        let dataManager: MainViewDataManager = createDataManager()
        
        // Creamos una instancia de MainViewModel que utilizará el dataManager
        let viewModel: MainViewModel = createViewModel(with: dataManager)
        
        // Configuramos el viewModel en el viewController
        viewController.set(viewModel: viewModel)
        
        // Retornamos el viewController
        return viewController
    }
    
    // MARK: - Private Methods
    
    // Creamos una instancia de MainViewDataManager
    private func createDataManager() -> MainViewDataManager {
        MainViewDataManager()
    }
    
    // Creamos una instancia de MainViewModel que utilizará el dataManager
    private func createViewModel(with dataManager: MainViewDataManager) -> MainViewModel {
        MainViewModel(dataManager: dataManager)
    }
    
    // MARK: - Public Methods
    
    /// Función genérica para navegar a otro ViewController
    func pushDetailViewController(navigationController: UINavigationController?, with image: UIImage?) {
        guard let navigationController = navigationController, let image = image else { return }
        let detailViewController = DetailViewController()
        detailViewController.image = image
        navigationController.pushViewController(detailViewController, animated: true)
    }
}

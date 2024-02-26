//
//  MainViewWireframe.swift
//  CamCatcher
//
//  Created by Daniel Cazorro Frias  on 26/2/24.
//

import Foundation

class MainViewWireframe {
    
    // MARK: - Properties
    var viewController: MainViewController {
        // Generating module components
        
        // Creamos una instancia de MainViewController
        let viewController: MainViewController = MainViewController(nibName: nil, bundle: nil)
        
        // Creamos una instancia de MainViewDataManager que se encargará de manejar los datos
        let dataManager: MainviewDataManager = createDataManager()
        
        // Creamos una instancia de MainViewModel que utilizará el dataManager
        let viewModel: MainViewModel = createViewModel(with: dataManager)
        
        
        // Configuramos el viewModel en el viewController
        viewController.set(viewModel: viewModel)
        
        // Retornamos el viewController
        return viewController
    }
    
    // MARK: - Private Methods
    
    // Creamos una instancia de MainViewDataManager
    private func createDataManager() -> MainviewDataManager {
        MainviewDataManager()
    }
    
    // Creamos una instancia de MainViewModel que utilizará el dataManager
    private func createViewModel(with dataManager: MainviewDataManager) -> MainViewModel {
        MainViewModel(dataManager: dataManager)
    }
    
}

//
//  MainViewController.swift
//  CamCatcher
//
//  Created by Daniel Cazorro Frias  on 26/2/24.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: - Properties
    private var viewModel: MainViewModel?
    
    // MARK: - Outlets
    @IBOutlet weak var tbMainToolbar: UIToolbar!
    @IBOutlet weak var tbbAddButton: UIBarButtonItem!
    @IBOutlet weak var tbMainTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAddButton()
    }

    // MARK: - Methods
    
    // Función para configurar el viewModel
    func set(viewModel: MainViewModel) {
        self.viewModel = viewModel
    }
    
    func configureAddButton() {
        // TODO: Center the button
        
        // Agregar acción al botón de añadir
        tbbAddButton.target = self
        tbbAddButton.action = #selector(addButtonTapped)
    }
    
    @objc func addButtonTapped() {
        // Mostrar el pop-up para elegir entre la galería y la cámara
        let alertController = UIAlertController(title: "Añadir imagen a la tabla", message: "Elija una opción", preferredStyle: .actionSheet)
        
        let galleryAction = UIAlertAction(title: "Seleccionar de la galería", style: .default) { _ in
            // Implementar la lógica para seleccionar de la galería
        }
        
        let cameraAction = UIAlertAction(title: "Tomar foto", style: .default) { _ in
            // Implementar la lógica para tomar una foto
        }
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        
        alertController.addAction(galleryAction)
        alertController.addAction(cameraAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }


    // MARK: - Actions
    @IBAction func tbbPushAddButton(_ sender: Any) {
    }
}

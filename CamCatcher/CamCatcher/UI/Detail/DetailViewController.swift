//
//  DetailViewController.swift
//  CamCatcher
//
//  Created by Daniel Cazorro Frias  on 26/2/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MARK: - Properties
    private var viewModel: DetailViewModel? // ViewModel para la lógica de la vista (si es necesario)
    var image: UIImage? // Propiedad para almacenar la imagen que se mostrará en pantalla

    // MARK: - Outlets
    @IBOutlet weak var imImageFull: UIImageView! // Vista de imagen para mostrar la imagen en pantalla completa

    override func viewDidLoad() {
        super.viewDidLoad()
        // Configurar la imagen en la vista de imagen
        configureImageView()
    }
    
    // MARK: - Methods

    /// Función para establecer el viewModel de la vista (si es necesario)
    func set(viewModel: DetailViewModel) {
        self.viewModel = viewModel
    }
    
    /// Configurar la vista de imagen con la imagen proporcionada
    func configureImageView() {
        imImageFull.image = image // Establecer la imagen en la vista de imagen
        imImageFull.contentMode = .scaleAspectFit // No es necesario ya que lo tenemos en el XIB
    }
}

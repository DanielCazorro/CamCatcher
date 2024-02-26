//
//  DetailViewController.swift
//  CamCatcher
//
//  Created by Daniel Cazorro Frias  on 26/2/24.
//

import UIKit

class DetailViewController: UIViewController {

    // MARK: - Properties
    private var viewModel: DetailViewModel?
    // Propiedad para almacenar la imagen
    var image: UIImage?
    
    // MARK: - Outlets
    @IBOutlet weak var imImageFull: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Configurar la imagen en la vista de imagen
        imImageFull.image = image
    }

    func set(viewModel: DetailViewModel) {
        self.viewModel = viewModel
    }
    

}

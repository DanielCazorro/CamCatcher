//
//  ImageViewCell.swift
//  CamCatcher
//
//  Created by Daniel Cazorro Frias  on 26/2/24.
//

import UIKit

class ImageViewCell: UITableViewCell {

    // MARK: - Properties
    /// Identificador estático para la celda, utilizado para la reutilización en la vista de tabla
    static let identifier = "ImageViewCell"
    
    // MARK: - Outlets
    /// IBOutlet para la vista de imagen en la celda
    @IBOutlet weak var ivImage: UIImageView!
    
    // MARK: - Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Configurar la apariencia de la imagen en la celda al cargar la celda desde el archivo de interfaz
        configurePicture()
    }
    
    // MARK: - Private Methods
    /// Método privado para configurar la apariencia de la imagen en la celda
    private func configurePicture() {
        // Establecer el modo de contenido para que la imagen se ajuste al tamaño de la vista manteniendo la proporción de aspecto original
        ivImage.contentMode = .scaleAspectFill
        
        // Recortar el contenido de la imagen que se desborde fuera de los límites de la vista de imagen
        ivImage.clipsToBounds = true
        
        // Establecer las esquinas redondeadas de la vista de imagen
        ivImage.layer.cornerRadius = 10
        
        // Agregar un borde a la vista de imagen
        ivImage.layer.borderWidth = 1
        
        // Establecer el color del borde de la vista de imagen
        ivImage.layer.borderColor = UIColor.black.cgColor
        
        // Ocultar el contenido de la vista de imagen que se desborda de las esquinas redondeadas
        ivImage.layer.masksToBounds = true
        
        // Establecer el color de fondo de la vista de imagen
        ivImage.backgroundColor = .clear
        
        // Establecer la opacidad de la vista de imagen
        ivImage.alpha = 0.8
        
        // Establecer el color de tinte de la vista de imagen
        ivImage.tintColor = .white
    }
}

//
//  ImageViewCell.swift
//  CamCatcher
//
//  Created by Daniel Cazorro Frias  on 26/2/24.
//

import UIKit

class ImageViewCell: UITableViewCell {

    
    static let identifier = "ImageViewCell"
    
    // MARK: - Outlets
    @IBOutlet weak var ivImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configurePicture()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configurePicture() {
        ivImage.contentMode = .scaleAspectFill
        ivImage.clipsToBounds = true // Esto es importante para asegurarse de que la imagen no se desborde de los límites de la vista
        ivImage.layer.cornerRadius = 10
        ivImage.layer.borderWidth = 1
        ivImage.layer.borderColor = UIColor.black.cgColor
        ivImage.layer.masksToBounds = true
        ivImage.backgroundColor = .clear
        
    }
    
}

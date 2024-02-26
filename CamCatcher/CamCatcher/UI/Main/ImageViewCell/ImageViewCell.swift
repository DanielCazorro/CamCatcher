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
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

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
    
    // MARK: - Outlets
    @IBOutlet weak var imImageFull: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func set(viewModel: DetailViewModel) {
        self.viewModel = viewModel
    }
    

}

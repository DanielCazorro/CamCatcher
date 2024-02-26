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

    }


    // MARK: - Actions
    @IBAction func tbbPushAddButton(_ sender: Any) {
    }
}

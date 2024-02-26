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
        tbbAddButton.customView?.centerYAnchor.constraint(equalTo: tbMainToolbar.centerYAnchor).isActive = true
        tbbAddButton.customView?.centerXAnchor.constraint(equalTo: tbMainToolbar.centerXAnchor).isActive = true
    }


    // MARK: - Actions
    @IBAction func tbbPushAddButton(_ sender: Any) {
    }
}

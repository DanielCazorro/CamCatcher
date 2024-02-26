//
//  MainViewController.swift
//  CamCatcher
//
//  Created by Daniel Cazorro Frias  on 26/2/24.
//

import UIKit
import Photos

class MainViewController: UIViewController, UITableViewDelegate {

    // MARK: - Properties
    private var viewModel: MainViewModel?
    
    // MARK: - Outlets
    @IBOutlet weak var tbMainToolbar: UIToolbar!
    @IBOutlet weak var tbbAddButton: UIBarButtonItem!
    @IBOutlet weak var tbMainTableView: UITableView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Inicializar el viewModel
        viewModel = MainViewModel(dataManager: MainViewDataManager())
        
        configureTableView()
//        configureAddButton()
    }

    // MARK: - Methods
    
    /// Función para configurar el viewModel
    func set(viewModel: MainViewModel) {
        self.viewModel = viewModel
    }
    
    func configureTableView() {
        tbMainTableView.dataSource = self
        tbMainTableView.delegate = self
        
        tbMainTableView.register(UINib(nibName: ImageViewCell.identifier, bundle: nil), forCellReuseIdentifier: ImageViewCell.identifier)
    }

    /// Configurar el botón de añadir en el toolbar
//    func configureAddButton() {
//        // TODO: Center the button
//        
//        // Agregar acción al botón de añadir
//        tbbAddButton.target = self
//        tbbAddButton.action = #selector(addButtonTapped)
//    }
    
//    /// Método llamado cuando se toca el botón de añadir
//     @objc private func addButtonTapped() {
//         viewModel?.presentImagePicker(from: self)
//     }
    
    /// Método llamado cuando se toca el botón de añadir
//    @objc func addButtonTapped() {
//        // Mostrar el pop-up para elegir entre la galería y la cámara
//        let alertController = UIAlertController(title: "Añadir imagen a la tabla", message: "Elija una opción", preferredStyle: .actionSheet)
//        
//        // Acción para seleccionar de la galería
//        let galleryAction = UIAlertAction(title: "Seleccionar de la galería", style: .default) { _ in
//            self.showImagePicker(sourceType: .photoLibrary)
//        }
//        
//        // Acción para tomar una foto con la cámara
//        let cameraAction = UIAlertAction(title: "Tomar foto", style: .default) { _ in
//            self.showImagePicker(sourceType: .camera)
//        }
//        
//        // Acción para cancelar
//        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
//        
//        alertController.addAction(galleryAction)
//        alertController.addAction(cameraAction)
//        alertController.addAction(cancelAction)
//        
//        // Presentar el pop-up
//        present(alertController, animated: true, completion: nil)
//    }
    
//    /// Método para mostrar el selector de imágenes
//    func showImagePicker(sourceType: UIImagePickerController.SourceType) {
//        // Verificar si el tipo de fuente está disponible
//        if UIImagePickerController.isSourceTypeAvailable(sourceType) {
//            let imagePicker = UIImagePickerController()
//            imagePicker.sourceType = sourceType
//            imagePicker.delegate = self
//            present(imagePicker, animated: true, completion: nil)
//        } else {
//            print("La fuente seleccionada no está disponible.")
//        }
//    }


    // MARK: - Actions
    @IBAction func tbbPushAddButton(_ sender: Any) {
        viewModel?.presentImagePicker(from: self)

        // Acción del botón de añadir en la barra de herramientas
        //TODO: Aquí añadir viewmodel acción de pulsar y toda la lógica de arriba
    }
}

// Extensiones para el delegado de UIImagePickerController
extension MainViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // Verificar si se seleccionó una imagen
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            print("Imagen seleccionada correctamente:", pickedImage)
            // Agregar la imagen al viewModel
            viewModel?.addImage(pickedImage)
            
            // Recargar la tabla para mostrar la nueva imagen
            tbMainTableView.reloadData()
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.images.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        160
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ImageViewCell.identifier, for: indexPath) as? ImageViewCell else {
            fatalError("No se pudo crear una instancia de ImageViewCell.")
        }
        
        // Obtener la imagen del viewModel
        if let image = viewModel?.images[indexPath.row] {
            // Asignar la imagen a la vista de imagen en la celda
            cell.ivImage.image = image
        } else {
            // Si no hay imagen disponible, puedes establecer una imagen de placeholder o dejarla vacía
            cell.ivImage.image = UIImage(systemName: "person.fill") // Cambia "placeholder_image" por el nombre de tu imagen de placeholder si la tienes
        }
        
        return cell
    }
}

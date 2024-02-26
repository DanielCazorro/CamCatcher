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
    private var viewModel: MainViewModel? // ViewModel que maneja la lógica de la vista
    
    // MARK: - Outlets
    @IBOutlet weak var tbMainToolbar: UIToolbar! // Barra de herramientas que contiene el botón de añadir
    @IBOutlet weak var tbbAddButton: UIBarButtonItem! // Botón de añadir en la barra de herramientas
    @IBOutlet weak var tbMainTableView: UITableView! // Tabla para mostrar las imágenes
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Inicializar el viewModel
        viewModel = MainViewModel(dataManager: MainViewDataManager())
        // Configurar la vista de tabla
        configureTableView()
    }

    // MARK: - Methods
    
    /// Función para configurar el viewModel
    func set(viewModel: MainViewModel) {
        self.viewModel = viewModel
    }
    
    /// Configura la vista de tabla (UITableView)
    func configureTableView() {
        tbMainTableView.dataSource = self
        tbMainTableView.delegate = self
        // Registra el nib (archivo XIB) para la celda personalizada ImageViewCell
        tbMainTableView.register(UINib(nibName: ImageViewCell.identifier, bundle: nil), forCellReuseIdentifier: ImageViewCell.identifier)
    }

    // MARK: - Actions
    /// Acción llamada cuando se pulsa el botón de añadir en el toolbar
    @IBAction func tbbPushAddButton(_ sender: Any) {
        viewModel?.presentImagePicker(from: self) // Solicita al viewModel que presente el selector de imágenes/
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
        // Devuelve el número de imágenes en el viewModel, o cero si el viewModel es nulo
        return viewModel?.images.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        104 // Altura de cada fila de la tabla (en puntos)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ImageViewCell.identifier, for: indexPath) as? ImageViewCell else {
            fatalError("No se pudo crear una instancia de ImageViewCell.")
        }
        
        // Obtiene la imagen del viewModel y la asigna a la vista de imagen en la celda
        if let image = viewModel?.images[indexPath.row] {
            // Asignar la imagen a la vista de imagen en la celda
            cell.ivImage.image = image
        } else {
            // Si no hay imagen disponible, puedes establecer una imagen de placeholder o dejarla vacía
            cell.ivImage.image = UIImage(systemName: "person.fill")
        }
        
        return cell // Devuelve la celda configurada para mostrar una imagen
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let image = viewModel?.images[indexPath.row] {
            // Utilizamos el wireframe para navegar a la vista de detalle
            MainViewWireframe().pushDetailViewController(navigationController: navigationController, with: image)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

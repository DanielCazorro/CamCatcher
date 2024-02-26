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
    @IBOutlet weak var tbMainToolbar: UIToolbar! // Barra de herramientas que contiene el botón de añadir
    @IBOutlet weak var tbbAddButton: UIBarButtonItem! // Botón de añadir en la barra de herramientas
    @IBOutlet weak var tbMainTableView: UITableView! // Tabla para mostrar las imágenes
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Inicializar el viewModel
        viewModel = MainViewModel(dataManager: MainViewDataManager())
        
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
    
    /// Método para mostrar el pop-up o modal con la imagen en grande
    private func showImagePopup(image: UIImage) {
        // Crear un controlador de alerta
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        // Crear un UIImageView para mostrar la imagen en el pop-up
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit // Ajusta el modo de contenido al tamaño de la imagen
        alertController.view.addSubview(imageView) // Agrega el UIImageView al pop-up

        
        // Configurar las restricciones para el UIImageView dentro del pop-up
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: alertController.view.topAnchor, constant: 80).isActive = true // Establece la posición superior
        imageView.bottomAnchor.constraint(equalTo: alertController.view.bottomAnchor, constant: -80).isActive = true // Establece la posición inferior
        imageView.leadingAnchor.constraint(equalTo: alertController.view.leadingAnchor, constant: 80).isActive = true // Establece la posición izquierda
        imageView.trailingAnchor.constraint(equalTo: alertController.view.trailingAnchor, constant: -80).isActive = true // Establece la posición derecha
        imageView.widthAnchor.constraint(equalToConstant: 400).isActive = true // Establece el ancho fijo
        imageView.heightAnchor.constraint(equalToConstant: 400).isActive = true // Establece la altura fija
        imageView.centerXAnchor.constraint(equalTo: alertController.view.centerXAnchor).isActive = true // Centra horizontalmente
        imageView.centerYAnchor.constraint(equalTo: alertController.view.centerYAnchor).isActive = true // Centra verticalmente
        imageView.layer.cornerRadius = 10 // Establece el radio de la esquina


        
        // Agregar un botón de "Cerrar" al pop-up
        let closeAction = UIAlertAction(title: "Cerrar", style: .default, handler: nil)
        alertController.addAction(closeAction)
        
        // Presentar el controlador de alerta
        present(alertController, animated: true, completion: nil)
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
            // Mostrar el pop-up con la imagen en grande
            showImagePopup(image: image)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

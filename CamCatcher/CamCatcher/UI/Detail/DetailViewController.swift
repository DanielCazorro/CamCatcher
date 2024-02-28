//
//  DetailViewController.swift
//  CamCatcher
//
//  Created by Daniel Cazorro Frias  on 26/2/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MARK: - Properties
    private var viewModel: DetailViewModel? // ViewModel para la lógica de la vista (si es necesario)
    var image: UIImage? // Propiedad para almacenar la imagen que se mostrará en pantalla

    // MARK: - Outlets
    @IBOutlet weak var svScrollViewImage: UIScrollView!
    @IBOutlet weak var imImageFull: UIImageView! // Vista de imagen para mostrar la imagen en pantalla completa

    override func viewDidLoad() {
        super.viewDidLoad()
        // Configurar la imagen en la vista de imagen
        configureImageView()
        configureScrollView()
    }
    
    // MARK: - Methods

    /// Función para establecer el viewModel de la vista (si es necesario)
    func set(viewModel: DetailViewModel) {
        self.viewModel = viewModel
    }
    
    /// Configurar la vista de imagen con la imagen proporcionada
    func configureImageView() {
        imImageFull.image = image // Establecer la imagen en la vista de imagen
        imImageFull.contentMode = .scaleAspectFit // No es necesario ya que lo tenemos en el XIB
        
    }
    
    func configureScrollView() {
        svScrollViewImage.maximumZoomScale = 4
        svScrollViewImage.minimumZoomScale = 1
        
        svScrollViewImage.delegate = self
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
             if scrollView.zoomScale > 1 {
                 if let image = imImageFull.image {
                     let ratioW = imImageFull.frame.width / image.size.width
                     let ratioH = imImageFull.frame.height / image.size.height
                     
                     let ratio = ratioW < ratioH ? ratioW : ratioH
                     let newWidth = image.size.width * ratio
                     let newHeight = image.size.height * ratio
                     let conditionLeft = newWidth*scrollView.zoomScale > imImageFull.frame.width
                     let left = 0.5 * (conditionLeft ? newWidth - imImageFull.frame.width : (scrollView.frame.width - scrollView.contentSize.width))
                     let conditioTop = newHeight*scrollView.zoomScale > imImageFull.frame.height
                     
                     let top = 0.5 * (conditioTop ? newHeight - imImageFull.frame.height : (scrollView.frame.height - scrollView.contentSize.height))
                     
                     scrollView.contentInset = UIEdgeInsets(top: top, left: left, bottom: top, right: left)
                     
                 }
             } else {
                 scrollView.contentInset = .zero
             }
         }
}

extension UIImageView {
  func enableZoom() {
    let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(startZooming(_:)))
    isUserInteractionEnabled = true
    addGestureRecognizer(pinchGesture)
  }

  @objc
  private func startZooming(_ sender: UIPinchGestureRecognizer) {
    let scaleResult = sender.view?.transform.scaledBy(x: sender.scale, y: sender.scale)
    guard let scale = scaleResult, scale.a > 1, scale.d > 1 else { return }
    sender.view?.transform = scale
    sender.scale = 1
  }
}

extension DetailViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imImageFull
    }
}

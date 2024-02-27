//
//  DetailView.swift
//  CamCatcherUI
//
//  Created by Daniel Cazorro Frias  on 27/2/24.
//

import SwiftUI

struct DetailView: View {
    var image: UIImage
    
    var body: some View {
        // Muestra la imagen en una vista redimensionable y con aspecto de ajuste
        Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .edgesIgnoringSafeArea(.all) // Ignora los márgenes seguros para que la imagen ocupe toda la pantalla
            .navigationBarTitle("", displayMode: .inline) // Configura el título de la barra de navegación
    }
}

#Preview {
    DetailView(image: UIImage(systemName: "camera")!)
}

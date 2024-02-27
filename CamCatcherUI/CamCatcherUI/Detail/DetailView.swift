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
        Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .edgesIgnoringSafeArea(.all)
            .navigationBarTitle("", displayMode: .inline)
    }
}

#Preview {
    DetailView(image: UIImage(systemName: "camera")!)
}

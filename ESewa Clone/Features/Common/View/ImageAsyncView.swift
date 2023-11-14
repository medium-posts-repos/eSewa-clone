//
//  ImageAsyncView.swift
//  ESewa Clone
//
//  Created by swornim-shah on 14/11/2023.
//

import SwiftUI

// IOS >= 15, Build in Native AsyncImage

struct ImageAsyncView: View {
    @State private var image: UIImage?
    
    let url: String
    
    var body: some View {
        if let image = image {
            Image(uiImage: image.withRenderingMode(.alwaysOriginal))
                .resizable()
        } else {
            // Placeholder view while the image is loading
            ProgressView()
                .frame(width: UIScreen.main.bounds.width - 32)
                .task {
                    loadImage()
                }
        }
    }
    
    private func loadImage() {
        URLSession.shared.dataTask(with: URL(string: url)!) { data, _, error in
            if let data = data, let loadedImage = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image = loadedImage
                }
            }
        }.resume()
    }
}

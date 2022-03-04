//
//  ImageDetailView.swift
//  FlickrImageSearch
//
//  Created by Sam LoBue on 3/3/22.
//

import SwiftUI

struct ImageDetailView: View {
    let image: FlickrImage?
    
    var body: some View {
        if let image = image, let imageURL = image.media.first?.value {
            VStack {
                Text(image.title)
                    .font(.title2.bold())
                    .padding(.bottom, 5.0)
                AsyncImage(url: URL(string: imageURL)) { image in
                    image
                        .resizable()
                } placeholder: {
                    Image(systemName: "photo")
                        .resizable()
                }
                .padding(.bottom, 5.0)
                .scaledToFit()
                Text(image.author)
                    .font(.callout)
                    .padding(.bottom, 5.0)
                Text("Date captured: \(image.imageDateFormatted)")
                    .font(.callout)
                    .padding(.bottom, 10.0)
                Text("Image width: \(image.imageWidth ?? "N/A")")
                    .font(.footnote)
                Text("Image height: \(image.imageHeight ?? "N/A")")
                    .font(.footnote)
                .font(.title)
            }
        } else {
            Image("xmark.octagon")
                .foregroundColor(.red)
        }
    }
}

struct ImageDetailView_Previews: PreviewProvider {
    static let image = MockFlickrImage.imagePreview
    static var previews: some View {
        ImageDetailView(image: image)
    }
}

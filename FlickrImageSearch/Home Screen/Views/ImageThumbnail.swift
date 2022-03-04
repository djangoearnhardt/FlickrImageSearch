//
//  ImageThumbnail.swift
//  FlickrImageSearch
//
//  Created by Sam LoBue on 3/3/22.
//

import SwiftUI

struct ImageThumbnail: View {
    let image: FlickrImage
    
    var body: some View {
        if let imageURL = image.media.first?.value {
            AsyncImage(url: URL(string: imageURL)) { image in
                image
                    .resizable()
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
            }
            .mask(alignment: .center) {
                RoundedRectangle(cornerRadius: 5).frame(width: nil, height: 65, alignment: .top)
            }
        } else {
            Image("xmark.octagon")
                .resizable()
                .foregroundColor(.red)
                .mask(alignment: .center) {
                    RoundedRectangle(cornerRadius: 20).frame(width: nil, height: 5, alignment: .top)
                }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static let image = MockFlickrImage.failedImagePreview
    static var previews: some View {
        ImageThumbnail(image: image)
    }
}

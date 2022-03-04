//
//  ContentView.swift
//  FlickrImageSearch
//
//  Created by Sam LoBue on 3/3/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ImageSearchScreen(viewModel: ImageSearchViewModel())
                .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  Shared
//
//  Created by Armin Kroll on 16/6/21.
//

import SwiftUI

struct ContentView: View {
    @State private var image: Image? = nil
    
    var body: some View {
        VStack {
            Text("Async/Await sample")
                .padding()
                .task {
                    if let uiImage = try? await ImageLoader().load() {
                        image = Image(uiImage: uiImage)
                    }
                }
            if let image = image {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            else {
                Text("loading image")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  randomduck
//
//  Created by dipro on 2/22/23.
//

import SwiftUI

struct ContentView: View {
    @State var imageUrl: URL! = randomUrl()
    @State var showingOptionsSheet: Bool = false
    @State var imageRadius: CGFloat = 7
    var body: some View {
        VStack {
            VStack {
                Spacer()
                AsyncImage(url: imageUrl) { image in image.resizable()
                } placeholder: {
                    VStack {
                        ProgressView()
                            .padding()
                        Text("The Ducks were all busy")
                            .fontWeight(.semibold)
                        Text("Please try again")
                            .font(.caption)
                    }
                }
                .scaledToFill()
                .clipShape(RoundedRectangle(cornerRadius: imageRadius))
            }
            .scaledToFit()
            .padding()
            Spacer()
            HStack {
                Button {
                    imageUrl = randomUrl()
                } label: {
                    VStack {
                        Image(systemName: "photo.on.rectangle.angled")
                            .font(.largeTitle)
                            .padding(.bottom, 4)
                        Text("Shuffle Photo")
                    }
                    .scaledToFit()
                }
                .buttonStyle(.bordered)
                .controlSize(.large)
                
                Button {
                    showingOptionsSheet.toggle()
                } label: {
                    VStack {
                        Image(systemName: "gearshape")
                            .font(.largeTitle)
                            .padding(.bottom, 4)
                        Text("Options")
                    }
                    .scaledToFit()
                }
                .buttonStyle(.bordered)
                .controlSize(.large)
            }
            .padding()
        }
        .sheet(isPresented: $showingOptionsSheet) {
            Form {
                Section("Image Corner Radius") {
                    VStack {
                        Slider(value: $imageRadius, in: 0...100)
                        HStack {
                            Spacer()
                            Text("Radius: \(Int(imageRadius))")
                                .font(.caption)
                        }
                    }
                }
                
                Section("Image Source") {
                    HStack {
                        Text("random-d.uk")
                        Spacer()
                        Link("Visit", destination: URL(string: "https://random-d.uk")!)
                    }
                }
            }
            VStack {
                Text("RandomDuck v1.0")
                Text("TheRedSpecial 2023")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

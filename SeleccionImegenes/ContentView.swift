import SwiftUI
import PhotosUI

struct ContentView: View {
    
    @StateObject var contentModel = ContentModel()
    
    var body: some View {
        Form {
            Section("Una Foto perfil") {
                VStack {
                    contentModel.imagen
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 150)
                    
                    Divider()
                    
                    PhotosPicker(selection: $contentModel.photoSeleccion, matching: .images, photoLibrary: .shared()) {
                        Label {
                            Text("Selecciona una imagen")
                        } icon: {
                            Image(systemName: "photo")
                        }
                        .tint(.red)
                        .foregroundStyle(.red)
                        .font(.title3)
                    }
                    
                }
            }
            
            Section("Varias Fotos") {
                VStack {
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(contentModel.imagenes) { imagen in
                                imagen
                                    .resizable()
                                    .frame(width: 150, height: 150)
                            }
                        }
                    }
                    
                    Divider()
                    
                    PhotosPicker(selection: $contentModel.photosSeleccion2, matching: .images, photoLibrary: .shared()) {
                        Label {
                            Text("Selecciona varias imagen")
                        } icon: {
                            Image(systemName: "photo")
                        }
                        .tint(.red)
                        .foregroundStyle(.red)
                        .font(.title3)
                    }
                    
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

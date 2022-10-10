import SwiftUI
import PhotosUI
import Foundation

class ContentModel: ObservableObject {
    
    @Published var imagen = Image(systemName: "photo")
    @Published var photoSeleccion: PhotosPickerItem? {
        didSet {
            if let photo = photoSeleccion {
                seleccionFoto(photo: photo)
            }
        }
    }
    
    private func seleccionFoto(photo: PhotosPickerItem) {
        photo.loadTransferable(type: Data.self) { resutado in
            DispatchQueue.main.async {
                switch resutado {
                case .success(let success):
                    if let data = success, let imgData: UIImage = UIImage(data: data) {
                        self.imagen = Image(uiImage: imgData)
                    } else {
                        self.imagen = Image(systemName: "photo")
                    }
                case .failure:
                    self.imagen = Image(systemName: "person.crop.circle.fill.badge.xmark")
                }
                
            }
        }
    }
    
    @Published var imagenes = [Image(systemName: "photo")]
    @Published var photosSeleccion2: PhotosPickerItem? {
        didSet {
            if let photo = photosSeleccion2 {
                seleccionFotos(photo: photo)
            }
        }
    }
    
    private func seleccionFotos(photo: PhotosPickerItem) {
        photo.loadTransferable(type: Data.self) { resutado in
            DispatchQueue.main.async {
                switch resutado {
                case .success(let success):
                    if let data = success, let imgData: UIImage = UIImage(data: data) {
                        self.imagenes.append(Image(uiImage: imgData))
                    } else {
                        self.imagenes.append(Image(systemName: "photo"))
                    }
                case .failure:
                    self.imagenes.append(Image(systemName: "person.crop.circle.fill.badge.xmark"))
                }
                
            }
        }
    }
    
}

extension Image: Identifiable {
    public var id: String { UUID().uuidString }
}

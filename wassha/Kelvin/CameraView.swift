import SwiftUI

struct ProfileImageView: View {
    @State private var image: UIImage?
    @State private var showImagePicker = false
    
    var body: some View {
        VStack {
            if let image = image {
                Image(uiImage: image)
                      .resizable()
                      .aspectRatio(contentMode: .fill)
                      .frame(width: 50, height: 50)
                      .clipShape(Circle())
                      .overlay(Circle().stroke(Color.white, lineWidth: 4))
                      .shadow(radius: 10)
                      .onTapGesture {
                          self.showImagePicker = true
                      }
              } else {
                  RoundedRectangle(cornerRadius: 10)
                  .fill(Color("overview-theme"))
                  .frame(width: 50, height: 50)
                  .overlay(
                      Image("rectangle")
                          .font(.system(size: 20))
                  )
                  .onTapGesture {
                      self.showImagePicker = true
                  }
            }
        }
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(image: self.$image)
        }
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    @Environment(\.presentationMode) private var presentationMode
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        // No need to update anything here
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.image = uiImage
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}


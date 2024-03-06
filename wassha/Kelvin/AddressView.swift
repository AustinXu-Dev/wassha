import SwiftUI

struct AddressView: View {
    @State private var address = "Dcondo"
    @State private var isEditing = false
    @State private var editedAddress = ""
    @State private var scrollProxy: ScrollViewProxy? = nil

    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                VStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white.opacity(0.2))
                        .frame(height: 50)
                        .overlay(
                            HStack {
                                if isEditing {
                                    TextField("Enter address", text: $editedAddress)
                                        .textFieldStyle(PlainTextFieldStyle())
                                } else {
                                    Text(address)
                                }
                                
                                Spacer()

                                Button(action: {
                                    if isEditing {
                                        address = editedAddress // Update address here
                                        isEditing.toggle()
                                    } else {
                                        isEditing.toggle()
                                        editedAddress = address // Sync editedAddress with address when editing starts
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                            withAnimation {
                                                scrollProxy = proxy
                                                scrollProxy?.scrollTo(0)
                                            }
                                        }
                                    }
                                }) {
                                    Text(isEditing ? "Save" : "Edit Address")
                                        .foregroundColor(.blue)
                                }
                                .padding(.horizontal)
                            }
                            .padding()
                        )
                }
                .padding()
            }
            .onAppear {
                scrollProxy = proxy
            }
        }
    }
}


import SwiftUI

//struct CheckoutView: View {
//    var body: some View {
//        ZStack {
//            Color.blue.opacity(0.8).edgesIgnoringSafeArea(.all)
//
//            VStack(alignment: .leading, spacing: 10) {
//                RoundedRectangle(cornerRadius: 10)
//                    .frame(height: 100)
//                    .foregroundColor(Color("checkout-color"))
//                    .overlay(
//                        HStack {
//                            VStack {
//                                Image("credit-cards")
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fit)
//                                    .frame(width: 50, height: 50)
//                                Text("Wassha Wallet")
//                                    .font(.caption)
//                                    .bold()
//                                    .foregroundColor(.white)
//                            }
//                            .padding()
//                            
//                            Spacer()
//                            
//                            Image(systemName: "arrow.right")
//                                .foregroundColor(.blue)
//                            Spacer()
//                            
//                            VStack {
//                                Image("shirt 1")
//                                Text("Dcondo")
//                                    .font(.caption)
//                                    .bold()
//                                    .foregroundColor(.blue)
//                            }
//                            .padding()
//                        }
//                        .foregroundColor(.white)
//                    )
//                    .padding()
//
//            }
//
//        }
//    }
//}


import SwiftUI

struct CheckoutView: View {
    var body: some View {
        ZStack {
            Color.blue.opacity(0.8).edgesIgnoringSafeArea(.all)

            VStack {
                VStack(alignment: .leading, spacing: 10) {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: 100)
                        .foregroundColor(Color("checkout-color"))
                        .overlay(
                            HStack {
                                VStack {
                                    Image("credit-cards")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 50, height: 50)
                                    Text("Wassha Wallet")
                                        .font(.caption)
                                        .bold()
                                        .foregroundColor(.white)
                                }
                                .padding()
    
                                Spacer()
    
                                Image(systemName: "arrow.right")
                                    .foregroundColor(.blue)
                                Spacer()
    
                                VStack {
                                    Image("shirt 1")
                                    Text("Dcondo")
                                        .font(.caption)
                                        .bold()
                                        .foregroundColor(.blue)
                                }
                                .padding()
                            }
                            .foregroundColor(.white)
                        )
                        .padding()
    
                }
                
                VStack(alignment: .leading) {
                    Text("Payment")
                        .font(.title)
                        .foregroundColor(.white)
                    Text("Please select payment option")
                        .font(.caption)
                        .foregroundColor(.white)
                    HStack (spacing: 20) {
                        PaymentOptionButton(text: "Wassha Wallet", imageName: "wallet.pass")
                        PaymentOptionButton(text: "Credit/Debit", imageName: "creditcard")
                        PaymentOptionButton(text: "eWallet", imageName: "waveform.path.ecg")
                    }
                }
                .padding()
                
                Spacer()
                
                Divider()
                
                HStack {
                    Spacer()
                    Text("Total")
                        .font(.title)
                    Spacer()
                    Text("฿150.00")
                        .font(.title3)
                        .foregroundColor(Color.blue)
                    Spacer()
                }
                .background(.white)
                .cornerRadius(10)
                .padding()
                
                // Pay Now Button
                Button("Pay Now") {
                    // Code to execute payment
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .foregroundColor(Color.white)
                .cornerRadius(10)
                
                Spacer()
            }
        }
    }
}

struct PaymentOptionButton: View {
    var text: String
    var imageName: String
    
    var body: some View {
        Button(action: {
            // Code to select payment option
        }) {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.white, lineWidth: 1)
                .overlay(
                    VStack {
                        Image(systemName: imageName)
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.white)
                        Text(text)
                            .font(.caption)
                            .foregroundColor(.white)
                    }
                )
                .frame(width: 100, height: 100)
        }
    }
}

//#Preview {
//    CheckoutView()
//}

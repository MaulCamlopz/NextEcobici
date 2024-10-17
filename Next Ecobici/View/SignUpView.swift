//
//  SignUpView.swift
//  Next Ecobici
//
//  Created by Maul Camlopz on 16/10/24.
//

import SwiftUI

struct SignUpView: View {
    
    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    
    @State private var authenticationSheetView: AuthenticationSheetView?
    @State private var textFieldEmail = ""
    @State private var textFieldPassword = ""
    
    var body: some View {
        VStack {
            
            Group {
                Text("Registro")
                    .font(.largeTitle)
                    .bold()
                    .padding(20)
                Text("Crea tu cuenta")
                    .padding(8)
            }
            .multilineTextAlignment(.center)

            
            Group {
                TextField("Email", text: $textFieldEmail )
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.blue.opacity(0.05))
                    .cornerRadius(10)
                
                SecureField( "Password", text: $textFieldPassword)
                    .padding()
                    .frame(width: 300, height:50)
                    .background(Color.blue.opacity(0.05))
                    .cornerRadius(10)
                
                Button("Aceptar") {
                    authenticationViewModel.createNewUser(email: textFieldEmail,
                                                          password: textFieldPassword)
                }
                .foregroundColor(.white)
                .frame(width: 300, height: 50)
                .background(Color.blue)
                .cornerRadius(10)
                if let messageError = authenticationViewModel.messageError {
                    Text(messageError)
                        .bold()
                        .font(.body)
                        .foregroundColor(.red)
                        .padding(.top, 20)
                }
            }
            .padding(4)
            
            Spacer()
        }
        
    }
    
}

#Preview {
    SignUpView(authenticationViewModel: AuthenticationViewModel())
}

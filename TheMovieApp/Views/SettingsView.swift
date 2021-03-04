//
//  SettingsView.swift
//  TheMovieApp
//
//  Created by Volodymyr Mendyk on 01.03.2021.
//

import SwiftUI

struct SettingsView: View {
    @Binding var isPresented: Bool
    @State private var selection = 1
    @State private var email = ""
    
    var body: some View {
        NavigationView {
            Form {
                Picker(selection: $selection, label: Text("Favorite Genre") ) {
                    Text("Action").tag(1)
                    Text("Shooter").tag(2)
                    Text("Comedy").tag(3)
                    Text("Horor").tag(4)
                    Text("Sci-Fi").tag(5)
                }
                Section(header: Text("Email")) {
                    TextField("Email", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                Button(action: {
                    isPresented.toggle()
                }) {
                   Text("Save")
                }
            } .navigationTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(isPresented: Binding<Bool>.constant(false))
    }
}

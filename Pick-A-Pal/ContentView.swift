//
//  ContentView.swift
//  Pick-A-Pal
//
//  Created by Tony Gultom on 13/08/24.
//

import SwiftUI

struct ContentView: View {
    @State private var names: [String] = []
    @State private var nameToAdd = ""
    @State private var pickedName = ""
    @State private var shouldRemovePickedName = false
    
    var body: some View {
        VStack(spacing: 8) {
            
            VStack {
                Image(systemName: "person.3.sequence.fill").foregroundStyle(.tint)  .symbolRenderingMode(.hierarchical)
                
                Text("Pick A Pal")
            }.font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).fontWeight(.bold)
            
            
            Text(pickedName.isEmpty ? "" : pickedName).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/).bold().foregroundStyle(.tint)
            
            List {
                ForEach(names, id: \.self) { name in    Text(name)
                }
            }.clipShape(RoundedRectangle(cornerRadius: 8.0))
            
            
            TextField("Add Name!", text: $nameToAdd).autocorrectionDisabled().onSubmit {
                
                if(!nameToAdd.isEmpty) {
                    names.append(nameToAdd)
                    nameToAdd = ""
                }
                
                
            }
            
            Divider()
            
            
            Toggle("Remove when picked", isOn: $shouldRemovePickedName)
            
            
            Button {
                let randomName = names.randomElement()
                
                if(shouldRemovePickedName) {
                    names.removeAll {
                        name in
                        return (name == randomName)
                    }
                }
                    
                pickedName = randomName ?? ""
            } label: {
                Text("Pick Random Name!")  .padding(.vertical, 8)
                    .padding(.horizontal, 16)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

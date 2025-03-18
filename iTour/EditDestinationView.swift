//
//  EditDestinationView.swift
//  iTour
//
//  Created by user262000 on 3/12/25.
//

import SwiftUI

struct EditDestinationView: View {
    @Bindable var destination: Destination
    @State private var newSightName = ""
    var body: some View {
        Form{
            TextField("Name", text: $destination.name)
            TextField("Detail", text: $destination.detail, axis: .vertical)
            DatePicker("Date", selection: $destination.date)
            Section("Priority"){
                Picker("Priority", selection: $destination.priority){
                    Text("Meh").tag(1)
                    Text("MayBe").tag(2)
                    Text("Must").tag(3)
                }
                .pickerStyle(.segmented)
                
            }
            
            Section("Sights"){
                ForEach(destination.sights) { sight in
                    Text(sight.name)
                }
                
                HStack {
                    TextField("Add a new sight in \(destination.name)", text:
                    $newSightName)
                    
                    Button("Add", action: addSight)
                }
            }
        }
        .navigationTitle("Edit Destination")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func addSight(){
        guard newSightName.isEmpty == false else { return }
        
        withAnimation {
            let sight = Sight(name: newSightName)
            destination.sights.append(sight)
            newSightName = ""
        }
    }
}

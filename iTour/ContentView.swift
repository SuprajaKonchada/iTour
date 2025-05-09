//
//  ContentView.swift
//  iTour
//
//  Created by user262000 on 3/12/25.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @State private var path = [Destination]()
    @State private var sortOrder = SortDescriptor(\Destination.name)
    @State private var searchText = ""
    //@Query var destinations: [Destination]


    var body: some View {
        NavigationStack(path: $path) {
            DestinationListingView(sort: sortOrder, searchString: searchText)
                .navigationTitle("iTour")
                .navigationDestination(
                    for: Destination.self, destination: EditDestinationView.init
                )
                .searchable(text: $searchText)
                .toolbar {
                    //                Button("Add Samples", action: addSamples)
                    Button(
                        "Add Destination", systemImage: "plus",
                        action: addDestination)
                    Menu("Sort", systemImage: "arrow.up.arrow.down"){
                        Picker("Sort", selection: $sortOrder) {
                            Text("Name")
                                .tag(SortDescriptor(\Destination.name))
                            Text("Priority")
                                .tag(SortDescriptor(\Destination.priority, order: .reverse))
                            Text("Date")
                                .tag(SortDescriptor(\Destination.date))
                        }
                        .pickerStyle(.inline)
                    }
                }
        }

    }

    //    func addSamples() {
    //        let supraja = Destination(name: "Supraja")
    //        let sanjay = Destination(name: "Sanjay")
    //        let sujatha = Destination(name: "Sujatha")
    //        modelContext.insert(supraja)
    //        modelContext.insert(sanjay)
    //        modelContext.insert(sujatha)
    //    }

    func addDestination() {
        let destination = Destination()
        modelContext.insert(destination)
        path = [destination]
    }

}

#Preview {
    ContentView()
}

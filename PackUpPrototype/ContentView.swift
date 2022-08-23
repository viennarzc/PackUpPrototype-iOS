//
//  ContentView.swift
//  PackUpPrototype
//
//  Created by Viennarz Curtiz on 8/21/22.
//

import SwiftUI

struct ContentView: View {
    @State private var items: [Item] = [
        Item(name: "Bag", isPacked: false),
        Item(name: "Medicine", isPacked: false)
    ]
    
    @State private var travelDate: Date = Date()
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Label("Makati", systemImage: "mappin.and.ellipse")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    Spacer()
                    DatePicker("Travel Date", selection: $travelDate, displayedComponents: .date)
                        .font(.caption)
                        .labelsHidden()
                    
                }
                .padding(.horizontal)
                
                Text("\(items.count) Items")
                    .foregroundColor(.secondary)
                List {
                    
                        ForEach($items) { $item in

                            HStack {
                                Button {
                                    withAnimation {
                                        item.isPacked.toggle()
                                    }
                                    
                                    
                                } label: {
                                    Image(systemName: item.isPacked ? "checkmark.circle.fill" : "circle")
                                        .font(.title.weight(.semibold))
                                        .foregroundColor(item.isPacked ? .white : .gray)
                                    
                                }
                                .buttonStyle(.plain)
                                
                                TextField("Ex: Food", text: $item.name)
                                    .font(.body.weight(.semibold))
                                    .foregroundColor(item.isPacked ? .white : .gray)
                                
                                Spacer()
                                
                                
                            }
                            .listRowSeparator(.hidden)
                            .interactiveDismissDisabled(false)
                            .padding()
                            .background(item.isPacked ? LinearGradient(colors: [.purple, .blue], startPoint: .leading, endPoint: .topTrailing) : LinearGradient(colors: [.white, .white], startPoint: .leading, endPoint: .trailing))
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .padding(.horizontal, item.isPacked ? 0 : 4)
                            .shadow(color: .gray.opacity(0.5), radius: 10, x: 0.9, y: 0.4)
                            .swipeActions(allowsFullSwipe: false) {
                                                     Button {
                                                         print("Packed Item}")
                                                     } label: {
                                                         Label("Pack", systemImage: "checkmark")
                                                     }
                                                     .tint(.green)

                                                     Button(role: .destructive) {
                                                         print("Deleting conversation")
                                                     } label: {
                                                         Label("Delete", systemImage: "trash.fill")
                                                     }
                             }

                            
                        }
                        .onDelete { _ in
                            
                        }
                        .onMove { index, _ in
                            
                        }
                    }
                    .navigationBarTitle("Packing List")
                    .listRowSeparatorTint(.clear)
                }
                .listStyle(.plain)
                .toolbar {

                    ToolbarItemGroup {
                        

                        Button {
                            withAnimation {
                                items.append(Item(name: "Item \(items.count + 1)", isPacked: false))

                            }
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                    
                    ToolbarItem {

                    }
                }
        }
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Item: Identifiable, Equatable {
    let id: UUID = UUID()
    var name: String
    var isPacked: Bool
    

}

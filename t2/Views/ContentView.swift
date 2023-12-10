//
//  ContentView.swift
//  t2
//
//  Integrate backend to this app 
//

import SwiftUI

struct ContentView: View {
    
    @State private var wallpapers: [Wallpapers] = WallpaperList.Top
    
    var body: some View {
        NavigationView{
            List(wallpapers , id:\.id ){i in
                NavigationLink(destination: DetailedView(wal: i), label: {
                    HStack{
                        Image(i.imgName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120,height: 70)
                            .cornerRadius(5)
                        
                        VStack(alignment: .leading) {
                            Text(i.wallpaperName)
                                .fontWeight(.semibold)
                                .lineLimit(2)
                            
                            Text(i.category)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        .padding(.trailing)
                    }
                })
            }.navigationTitle("Wallpapers")
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



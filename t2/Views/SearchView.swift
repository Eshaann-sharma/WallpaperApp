//
//  SearchView.swift
//  t2
//
//  Created by Eshaan Sharma on 16/09/23.
//

import SwiftUI

struct SearchView: View {
    
    @State private var wallpapers: [Wallpapers] = WallpaperList.Top
    @State private var searchedText = ""
    
    var filteredWallpapers:[Wallpapers]{
        guard !searchedText.isEmpty else{ return wallpapers}
        return wallpapers.filter{
            wallpapers in wallpapers.category.localizedCaseInsensitiveContains(searchedText)
        }
    }
    
    var body: some View {
        NavigationView{
            List(filteredWallpapers , id:\.id ){i in
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
            }.navigationTitle("Wallpapers").searchable(text: $searchedText)
        }
    }
    
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

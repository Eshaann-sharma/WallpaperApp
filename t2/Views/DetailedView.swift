//
//  DetailedView.swift
//  t2
//
//  Created by Eshaan Sharma on 10/06/23.
//

import SwiftUI

struct DetailedView: View {
    
    var wal : Wallpapers
    
    var body: some View {
        
        VStack {
            Image(wal.imgName)
                .resizable()
                .scaledToFit()
                .blur(radius: 0.1)
                .hoverEffect()
            
            Text(wal.category)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Spacer()
            
            Link(destination: wal.url , label: {
                Text("DOWNlOAD LINK")
                    .font(.title2)
                    .frame(width: 200, height: 35 ,alignment: .center)
                    .background(Color(.secondarySystemFill))
                    .foregroundColor(.primary)
                    .cornerRadius(10)
            })
        }.navigationBarTitle(wal.wallpaperName)
    }
}

struct DetailedView_Previews: PreviewProvider {
    
    static var previews: some View {
        DetailedView(wal : WallpaperList.Top.first!)
    }
}

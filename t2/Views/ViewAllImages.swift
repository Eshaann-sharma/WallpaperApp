//
//  ViewAllImages.swift
//  t2
//
//  Created by Eshaan Sharma on 31/08/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct ViewAllImages: View {
    
    var colums:[GridItem] = [GridItem(.flexible()),GridItem(.flexible())]
    @EnvironmentObject var vm:DataManager
    @Environment(\.dismiss) var dismiss
    let images:[String]
    var body: some View {
        ZStack{
            ScrollView(.vertical,showsIndicators: false){
                LazyVGrid(columns: colums){
                    ForEach(images,id: \.self){url in
                        WebImage(url:URL(string: url))
                            .resizable()
                            .scaledToFit()
                            .frame(width: 180,height: 350)
                            .cornerRadius(20)
                            .onTapGesture {
                                vm.selectedImage = url
                            }
                    }.offset(y:50)
                }
            }
            .overlay(alignment: .topTrailing){
                Button{
                    dismiss()
                }label: {
                    Image(systemName: "xmark")
                        .font(.title3)
                        .foregroundColor(.black.opacity(0.7))
                        .padding(6)
                        .background(.white.opacity(6))
                        .clipShape(Circle())
                }
                .offset(x:-10 , y: -5)
            }
            .padding(.horizontal,10)
            if vm.selectedImage != nil{
                ImageView()
            }
        }
        
    }
}

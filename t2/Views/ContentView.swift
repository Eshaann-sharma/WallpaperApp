import SwiftUI
import SDWebImageSwiftUI
import Photos
import Firebase

struct ContentView: View {
    
    @EnvironmentObject var vm: DataManager
    @State private var showAllImages1: Bool = false
    @State private var showAllImages2: Bool = false
    
    var body: some View {
        ZStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    HStack {
                        Text("Nature")
                            .font(.headline)
                        Spacer()
                        Button(action: {
                            showAllImages1 = true
                        }) {
                            Text("View All")
                        }
                    }
                    .padding(.horizontal)
                    
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(vm.imageUrl.prefix(4), id: \.self) { url in
                                WebImage(url: URL(string: url))
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 280, height: 170)
                                    .cornerRadius(15)
                                    .onTapGesture {
                                        vm.selectedImage = url
                                    }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.vertical)
                
                VStack {
                    HStack {
                        Text("Exotic Cars")
                            .font(.headline)
                        Spacer()
                        Button(action: {
                            showAllImages1 = true
                        }) {
                            Text("View All")
                        }
                    }
                    .padding(.horizontal)
                    
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(vm.imageUrlCars.prefix(4), id: \.self) { url in
                                WebImage(url: URL(string: url))
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 180, height: 350)
                                    .cornerRadius(15)
                                    .onTapGesture {
                                        vm.selectedImage = url
                                    }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.vertical)
            }
            .onAppear {
                vm.loadImage(name: "images") { url in
                    vm.imageUrl.append(url)
                }
                vm.loadImage(name: "cars") { url in
                    vm.imageUrlCars.append(url)
                }
            }
            .padding(.top)
            .padding(.horizontal,5)
            if vm.selectedImage != nil{
                ImageView()
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
                .environmentObject(DataManager())
        }
    }
    
    struct ImageViewUrl: View {
        let url: String
        
        var body: some View {
            WebImage(url: URL(string: url))
                .resizable()
                .scaledToFit()
                .frame(width: 160, height: 350)
                .cornerRadius(10)
        }
    }
}

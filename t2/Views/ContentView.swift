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
                scrollviewss(heading: "Aesthetic", collectionName: "images",w:280,h: 170, imageUrls: $vm.imageUrl)
                
                scrollviewss(heading: "Exotic Cars", collectionName: "cars",w:160,h: 350, imageUrls: $vm.imageUrlCars)
                
                scrollviewss(heading: "Anime", collectionName: "anime",w:160,h: 350, imageUrls: $vm.imageUrlAnime)
                
                scrollviewss(heading: "Valorant Art", collectionName: "valorant",w:160,h: 350, imageUrls: $vm.imageUrlValorant)
                
                
            }
            .padding(.top)
            .padding(.horizontal, 5)
            
            if vm.selectedImage != nil {
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
    
    struct scrollviewss: View {
        
        @EnvironmentObject var vm: DataManager
        @State private var showAllImages: Bool = false
        let heading: String
        let collectionName: String
        let w: CGFloat
        let h: CGFloat
        @Binding var imageUrls: [String]
        
        var body: some View {
            VStack {
                HStack {
                    Text(heading)
                        .font(.headline)
                    Spacer()
                    Button(action: {
                        showAllImages = true
                    }) {
                        Text("View All")
                    }
                }
                .padding(.horizontal)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(imageUrls.prefix(4), id: \.self) { url in
                            WebImage(url: URL(string: url))
                                .resizable()
                                .scaledToFill()
                                .frame(width: w, height: h)
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
            .onAppear {
                vm.loadImage(name: collectionName) { url in
                    imageUrls.append(url)
                }
            }
            .fullScreenCover(isPresented: $showAllImages){
                ViewAllImages(images: imageUrls)
                    .environmentObject(vm)
            }
        }
    }
}

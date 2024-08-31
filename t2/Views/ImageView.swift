import SwiftUI
import SDWebImageSwiftUI

struct ImageView: View {
    
    @EnvironmentObject var vm:DataManager
    
    var body: some View {
        ZStack {
            ZStack{
                Color.black.opacity(0.5)
                    .ignoresSafeArea()
                WebImage(url: URL(string: vm.selectedImage ?? ""))
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: UIScreen.main.bounds.width - 50,
                            maxHeight: UIScreen.main.bounds.height - 200)
                    .clipped()
                    .cornerRadius(15)
                    .overlay(alignment:.bottom ){
                        HStack(spacing:25){
                            ZStack{
                                Circle()
                                    .stroke(Color.gray.opacity(0.2),lineWidth:5)
                                Circle()
                                    .trim(from: 0.0, to: vm.animatedCircle ? 1.0 : 0.0)
                                    .stroke(Color.green,lineWidth: 5)
                                    .rotationEffect(.degrees(-90))
                                    .animation(.easeInOut(duration: 2.0),value: vm.animatedCircle)
                                Button{
                                    vm.animatedCircle.toggle()
                                    vm.downloadansSaveImage(url: vm.selectedImage ?? "")
                                } label: {
                                    Image(systemName: vm.animatedCircle ? "checkmark":"arrow.down.to.line")
                                        .font(.title3)
                                        .foregroundColor(vm.animatedCircle ? .green : .black.opacity(0.7))
                                        .padding(6)
                                        .background(.white.opacity(6))
                                        .clipShape(Circle())
                                }
                            }.frame(width: 35,height: 35)
                                .padding(.horizontal)
                            Spacer()
                            Button{
                                vm.selectedImage = nil
                                vm.animatedCircle = false
                            } label: {
                                Image(systemName: "xmark")
                                    .font(.title3)
                                    .foregroundColor(.black.opacity(0.7))
                                    .padding(6)
                                    .background(.white.opacity(6))
                                    .clipShape(Circle())
                            }.padding()
                            
                        }
                }.padding()
            }
        }
    }
}

#Preview {
    ImageView()
        .environmentObject(DataManager())
}

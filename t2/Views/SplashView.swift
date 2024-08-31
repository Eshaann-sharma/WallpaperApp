import SwiftUI

struct SplashView: View {

    @State private var size = 10.0
    @State private var view = false

    var body: some View {
        if view {
            MainView().preferredColorScheme(.dark)
        }
        else{
            Image("Logo")
                .resizable()
                .frame(width: size ,height: size)
                .onAppear{
                    withAnimation(.easeIn(duration: 0.8)){
                        self.size = 100.0
                }
                }.onAppear{
                    DispatchQueue.main.asyncAfter(deadline: .now()+0.8){
                        withAnimation(.easeIn){
                            view.toggle()
                        }
                    }
                }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}

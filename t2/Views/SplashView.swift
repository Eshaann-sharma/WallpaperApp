//
//  SplashView.swift
//  t2
//

//  to do - invert the image color only if dark mode active
//
import SwiftUI

struct SplashView: View {

    @State private var size = 10.0
    @State private var view = false

    var body: some View {
        if view {
            MainView().preferredColorScheme(.dark)
                .environmentObject(DataManager())
        }
        else{
            Image("skull")
                .resizable()
                .frame(width: size ,height: size)
                .colorInvert()
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

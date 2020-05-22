
import Foundation
import SwiftUI

struct ActivityIndicator : UIViewRepresentable {
    @Binding var isAnimating:Bool
    let style: UIActivityIndicatorView.Style
    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: .large)
    }
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}

struct LoadingView<Content>: View where Content: View {

    @Binding var isShowing: Bool
    var content: () -> Content

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .center) {

                self.content()
                    .disabled(self.isShowing)
                    .blur(radius: self.isShowing ? 3 : 0)

                VStack {
                    Text("Loading...")
                    ActivityIndicator(isAnimating: .constant(true), style: .large)
                }
                .frame(width: geometry.size.width / 2,
                       height: geometry.size.height / 5)
                .background(Color.secondary.colorInvert())
                .foregroundColor(Color.primary)
                .cornerRadius(20)
                .opacity(self.isShowing ? 1 : 0)

            }
        }
    }

}
struct ContentView2: View {
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                Text("Left")
                    .frame(width: geometry.size.width / 2, height: 50)
                    .background(Color.yellow)
                Text("Right")
                    .frame(width: geometry.size.width / 2, height: 50)
                    .background(Color.orange)
            }
        }
    }
}
struct ContentView2_Previews : PreviewProvider {
   
        static var previews: some View {
            ContentView2()
        }

}
struct TestView:View {
    var body: some View {
        ZStack{
            Image("photo")
            Text("sudhakar")
            .padding()
                .background(Color.red)
                .foregroundColor(.white)
            .offset(x: 0, y: 80)
        }
    }
}
struct TestView_Previews :PreviewProvider {
    static var previews: some View {
        TestView()
    }
}

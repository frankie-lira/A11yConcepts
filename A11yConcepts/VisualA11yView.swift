
import SwiftUI

struct VisualA11yView: View {
    var body: some View {
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
            NavigationLink(destination: DynamicTypeView()) {
                VStack {
                    Image(systemName: "textformat.size")
                        .font(.largeTitle)
                    Text("Dynamic Type")
                        .font(.headline)
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.2)))
            }
            NavigationLink(destination: ColorContrastView()) {
                VStack {
                    Image(systemName: "eyedropper.halffull")
                        .font(.largeTitle)
                    Text("Color Contrast")
                        .font(.headline)
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.2)))
            }
//            NavigationLink(destination: HighContrastView()) {
//                VStack {
//                    Image(systemName: "moon.circle")
//                        .font(.largeTitle)
//                    Text("High Contrast Mode")
//                        .font(.headline)
//                }
//                .padding()
//                .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.2)))
//            }
//            NavigationLink(destination: ScalableImagesView()) {
//                VStack {
//                    Image(systemName: "photo.fill")
//                        .font(.largeTitle)
//                    Text("Scalable Images")
//                        .font(.headline)
//                }
//                .padding()
//                .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.2)))
//            }
//            NavigationLink(destination: AdaptiveColorsView()) {
//                VStack {
//                    Image(systemName: "paintpalette.fill")
//                        .font(.largeTitle)
//                    Text("Adaptive Colors")
//                        .font(.headline)
//                }
//                .padding()
//                .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.2)))
//            }
//            NavigationLink(destination: CustomColorsView()) {
//                VStack {
//                    Image(systemName: "circle.lefthalf.fill")
//                        .font(.largeTitle)
//                    Text("Custom Colors")
//                        .font(.headline)
//                }
//                .padding()
//                .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.2)))
//            }
        }
        .navigationTitle("Visual Accessibility")
    }
}

#Preview {
    VisualA11yView()
}

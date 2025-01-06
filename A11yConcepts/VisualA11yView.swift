
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
//            NavigationLink(destination: ColorContrastView()) {
//                VStack {
//                    Image(systemName: "eyedropper.halffull")
//                        .font(.largeTitle)
//                    Text("Color Contrast")
//                        .font(.headline)
//                }
//                .padding()
//                .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.2)))
//            }
            // Add more topics
        }
        .navigationTitle("Visual Accessibility")
    }
}

#Preview {
    VisualA11yView()
}

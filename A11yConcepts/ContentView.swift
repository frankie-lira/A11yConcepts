import SwiftUI

struct ContentView: View {
    // Define categories for the grid
    let categories = [
        ("Visual Accessibility", "eye", VisualA11yView()),
        ("Interaction Accessibility", "hand.point.up.left", VisualA11yView()),
        ("Custom Components", "slider.horizontal.3", VisualA11yView()),
        ("VoiceOver", "mic.fill", VisualA11yView()),
        ("Error Handling", "exclamationmark.triangle", VisualA11yView()),
        ("Dynamic Type", "textformat.size", VisualA11yView())
    ]
    
    // Define the grid layout
    let columns = [
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20)
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(categories, id: \.0) { category in
                        NavigationLink(destination: category.2) {
                            VStack {
                                Image(systemName: category.1)
                                    .font(.system(size: 40))
                                    .foregroundColor(.blue)
                                Text(category.0)
                                    .font(.headline)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.primary)
                            }
                            .frame(maxWidth: .infinity, minHeight: 120) // Set equal height
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color(UIColor.systemGray6)))
                            .shadow(radius: 2)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Accessibility Concepts")
        }
    }
}

#Preview {
    ContentView()
}

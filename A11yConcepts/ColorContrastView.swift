import SwiftUI

struct ColorContrastView: View {
    private var darkGreen = Color(red: 0 / 255, green: 102 / 255, blue: 0 / 255)
    private var darkRed = Color(red: 220 / 255, green: 20 / 255, blue: 60 / 255)
    private var lightGray = Color(red: 200 / 255, green: 200 / 255, blue: 200 / 255)
    private var highContrastText = Color(red: 0 / 255, green: 0 / 255, blue: 0 / 255)
    private var lowContrastText = Color(red: 120 / 255, green: 120 / 255, blue: 120 / 255)

    struct ExampleHeader: View {
        let title: String
        let color: Color
        let isGoodExample: Bool

        var body: some View {
            Text(title)
                .font(.subheadline)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .accessibilityAddTraits(.isHeader)
                .foregroundColor(isGoodExample ? color : .red)
        }
    }

    struct ExampleCard<Content: View>: View {
        let content: Content

        init(@ViewBuilder content: () -> Content) {
            self.content = content()
        }

        var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color(.systemBackground)) // Card background
                    .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
                VStack {
                    content
                }
                .padding()
            }
            .padding(.horizontal)
        }
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Description Section
                Text("Color contrast ensures that text and interface elements are legible against their background. Use sufficient contrast ratios between text and background colors to meet accessibility standards.")
                    .font(.body)
                    .fixedSize(horizontal: false, vertical: true)
                    .foregroundColor(.primary)
                    .padding(.bottom)

                // Good Examples Section
                ExampleHeader(title: "Good Examples", color: darkGreen, isGoodExample: true)

                ExampleCard {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Good Example: High Contrast Text")
                            .font(.subheadline)
                            .fontWeight(.bold)
                        Text("This text has sufficient contrast.")
                            .padding()
                            .background(lightGray)
                            .foregroundColor(highContrastText)
                            .cornerRadius(8)
                        DisclosureGroup("Details") {
                            Text("This good example ensures the text and background have a contrast ratio of at least 4.5:1, meeting WCAG guidelines.")
                        }
                    }
                }

                // Bad Examples Section
                ExampleHeader(title: "Bad Examples", color: darkRed, isGoodExample: false)

                ExampleCard {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Bad Example: Low Contrast Text")
                            .font(.subheadline)
                            .fontWeight(.bold)
                        Text("This text has insufficient contrast.")
                            .padding()
                            .background(lightGray)
                            .foregroundColor(lowContrastText)
                            .cornerRadius(8)
                        DisclosureGroup("Details") {
                            Text("This bad example fails to provide enough contrast between the text and background, making it hard to read.")
                        }
                    }
                }
            }
            .padding()
            .navigationTitle("Color Contrast")
        }
    }
}

struct ColorContrastView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ColorContrastView()
        }
    }
}

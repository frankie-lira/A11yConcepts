import SwiftUI

struct DynamicTypeView: View {
    @State private var email: String = "givenname.familyname2@companyname.com"
    private var darkGreen = Color(red: 0 / 255, green: 102 / 255, blue: 0 / 255)
    private var darkRed = Color(red: 220 / 255, green: 20 / 255, blue: 60 / 255)
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    @FocusState var isInputActive: Bool

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
                Text("Dynamic Type is used to select text styles that automatically scale to larger sizes in response to the user's system text size settings. Use a `.font()` style like `.largeTitle`, `.caption`, `.headline`, `.subheadline`, etc. Or use text with no size defined and it will dynamically scale. Avoid using `.lineLimit()` which will cause text truncation. Use `axis: .vertical` to enable `TextField` value text to expand vertically rather than truncate.")
                    .font(.body)
                    .fixedSize(horizontal: false, vertical: true)
                    .foregroundColor(.primary)
                    .padding(.bottom)

                // Good Examples Section
                ExampleHeader(title: "Good Examples", color: darkGreen, isGoodExample: true)

                ExampleCard {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Good Example `Text().font(.largeTitle)` and `TextField(axis: .vertical)`")
                            .font(.subheadline)
                            .fontWeight(.bold)
                        TextField("", text: $email, axis: .vertical)
                            .font(.largeTitle)
                            .padding()
                            .border(Color.secondary)
                        DisclosureGroup("Details") {
                            Text("The first good example uses `.font(.largeTitle)`...")
                        }
                    }
                }

                ExampleCard {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Good Example Conditional Layout")
                            .font(.subheadline)
                            .fontWeight(.bold)
                        if dynamicTypeSize > .large {
                            VStack {
                                Text("This is a VStack layout")
                                    .font(.headline)
                                Text("for larger dynamic type sizes.")
                                    .font(.body)
                            }
                        } else {
                            HStack {
                                Text("This is an HStack layout")
                                    .font(.headline)
                                Text("for smaller dynamic type sizes.")
                                    .font(.body)
                            }
                        }
                        DisclosureGroup("Details") {
                            Text("This good example switches between `HStack` and `VStack`...")
                        }
                    }
                }

                // Bad Examples Section
                ExampleHeader(title: "Bad Examples", color: darkRed, isGoodExample: false)

                ExampleCard {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Bad Example `Text().lineLimit(1)`")
                            .font(.subheadline)
                            .fontWeight(.bold)
                        TextField("", text: $email)
                            .font(.largeTitle)
                            .lineLimit(1)
                            .padding()
                            .border(Color.secondary)
                        DisclosureGroup("Details") {
                            Text("The first bad example uses `.lineLimit(1)`...")
                        }
                    }
                }

                ExampleCard {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Bad Example Fixed Layout")
                            .font(.subheadline)
                            .fontWeight(.bold)
                        HStack {
                            Text("This layout does not adapt")
                                .font(.headline)
                            Text("to larger text sizes.")
                                .font(.body)
                        }
                        DisclosureGroup("Details") {
                            Text("This bad example uses a fixed `HStack`...")
                        }
                    }
                }
            }
            .padding()
            .navigationTitle("Dynamic Type")
        }
    }
}

struct DynamicTypeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            DynamicTypeView()
        }
    }
}

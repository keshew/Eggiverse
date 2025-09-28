import SwiftUI

struct CustomSegmentedControl: View {
    @Binding var selectedIndex: Int
    let titles: [String]
    @Namespace private var animationNamespace
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(titles.indices, id: \.self) { index in
                Button(action: {
                    withAnimation {
                        selectedIndex = index
                    }
                }) {
                    Text(titles[index])
                        .InterMedium(size: 14)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                        .background(
                            ZStack {
                                if selectedIndex == index {
                                    RoundedRectangle(cornerRadius: 16)
                                        .fill(Color.white)
                                        .frame(height: 25)
                                        .padding(.horizontal, 5)
                                        .matchedGeometryEffect(id: "highlight", in: animationNamespace)
                                }
                            }
                        )
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
        .background(RoundedRectangle(cornerRadius: 16).fill(Color(red: 242/255, green: 231/255, blue: 231/255)))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

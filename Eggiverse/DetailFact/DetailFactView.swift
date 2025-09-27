import SwiftUI

struct DetailFactView: View {
    @StateObject var detailFactModel =  DetailFactViewModel()
    @Environment(\.presentationMode) var presentationMode
    @Binding var fact: FactModel
    
    var body: some View {
        ZStack {
            Color(red: 236/255, green: 252/255, blue: 246/255).ignoresSafeArea()
            
            VStack {
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "arrow.left")
                            .foregroundStyle(.black)
                            .font(.system(size: 20))
                    }
                    
                    Spacer()
                    
                    Text(fact.title)
                        .InterBold(size: 20)
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }) {
                        Image(systemName: "arrow.left")
                            .foregroundStyle(.black)
                            .font(.system(size: 20))
                    }
                    .disabled(true)
                    .hidden()
                }
                .padding(.horizontal)
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 25) {
                        ForEach(0..<2, id: \.self) { index in
                            Image(fact.detailImages[index])
                                .resizable()
                                .frame(width: 320, height: 180)
                                .cornerRadius(8)
                            
                            Text(fact.detailInfo[index])
                                .InterRegular(size: 18)
                                .frame(width: 280)
                        }
                    }
                    .padding(.top)
                }
            }
            .padding(.top)
        }
    }
}

#Preview {
    DetailFactView(fact: .constant(FactModel(
        image: "fact1",
        detailImages: ["fact2", "fact3"],
        title: "Feathers",
        desc: "Birds are the only modern animals that have feathers.",
        detailInfo: [
            "In these tiny birds, it takes up to 2.5% of their body weight (which is a huge proportion for such a size).",
            "In flight, the hummingbird's heart can beat at a frequency of up to 1,200 beats per minute, and at rest — about 250."
        ],
        type: "Anatomy"
    )))
}


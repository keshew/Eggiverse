import SwiftUI

struct SplashItem: Identifiable {
    var id = UUID().uuidString
    var image: String
    var title: String
    var desc: String
}

struct SplashView: View {
    @StateObject var splashModel =  SplashViewModel()
    @State var arraySplashItems = [SplashItem(image: "splashImg1", title: "Learn Fun Facts", desc: "Discover surprising facts about eggs and birds every day."),
                                   SplashItem(image: "splashImg2", title: "Daily Quizzes", desc: "Challenge yourself and test your knowledge."),
                                   SplashItem(image: "splashImg3", title: "Cooking Guide", desc: "Make perfect eggs with smart timers and tips.")]
    var body: some View {
        ZStack {
            Color(red: 254/255, green: 250/255, blue: 233/255).ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack {
                    VStack(spacing: 20) {
                        Text("Welcome Eggiverse!")
                            .InterBold(size: 28)
                        
                        Text("Your mentor's guide to the world of eggs and birds!")
                            .InterRegular(size: 15)
                    }
                    
                    ZStack {
                        Image(.bagEgg)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 200)
                        
                        Image(.birdLeftSide)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 55, height: 50)
                            .offset(x: -100, y: -60)
                        
                        Image(.birdRightSide)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 55, height: 50)
                            .offset(x: 90, y: -100)
                    }
                    .padding(.top, 100)
                    
                    VStack(alignment: .leading, spacing: 25) {
                        ForEach(arraySplashItems) { item in
                            HStack  {
                                Image(item.image)
                                    .resizable()
                                    .frame(width: 60, height: 60)
                                
                                VStack(alignment: .leading, spacing: 2) {
                                    Text(item.title)
                                        .InterBold(size: 16)
                                    
                                    Text(item.desc)
                                        .InterRegular(size: 12)
                                }
                                .padding(.leading, 7)
                                .padding(.top, 2)
                                
                                Spacer()
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 50)
                    
                    Button(action: {
                        
                    }) {
                        Rectangle()
                            .fill(Color(red: 248/255, green: 160/255, blue: 17/255))
                            .overlay {
                                Text("Get Started")
                                    .InterBold(size: 18, color: .white)
                            }
                            .frame(width: 290, height: 50)
                            .cornerRadius(12)
                    }
                    .padding(.top, 30)
                }
                .padding()
            }
        }
    }
}

#Preview {
    SplashView()
}


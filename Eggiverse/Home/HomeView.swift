import SwiftUI

struct HomeView: View {
    @StateObject var homeModel =  HomeViewModel()
    @Binding var selectedTab: CustomTabBar.TabType
    
    var body: some View {
        ZStack {
            Color(red: 254/255, green: 250/255, blue: 233/255).ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack {
                    Image(.mainLabel)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 40)
                    
                    Text("Your ideal helper for knowledge about eggs and birds.")
                        .InterMedium(size: 13)
                        .padding(.top, 10)
                    
                    ZStack(alignment: .bottom) {
                        ZStack(alignment: .top) {
                            Rectangle()
                                .fill(Color(red: 254/255, green: 250/255, blue: 233/255))
                                .frame(height: 300)
                                .cornerRadius(12)
                                .shadow(radius: 5)
                            
                            VStack {
                                ZStack(alignment: .top) {
                                    Image(.mockFact)
                                        .resizable()
                                        .frame(height: 175)
                                    
                                    HStack {
                                        Button(action: {
                                            
                                        }) {
                                            Rectangle()
                                                .fill(.white)
                                                .frame(width: 45, height: 30)
                                                .overlay {
                                                    Image(systemName: "chevron.left")
                                                        .foregroundStyle(.black)
                                                }
                                                .cornerRadius(20)
                                                .opacity(1)
                                        }
                                        
                                        Spacer()
                                        
                                        Rectangle()
                                            .fill(.white)
                                            .frame(width: 85, height: 30)
                                            .opacity(0.85)
                                            .overlay {
                                                Text("Today’s Fact")
                                                    .InterBold(size: 10)
                                            }
                                            .cornerRadius(8)
                                        
                                        
                                        Spacer()
                                        
                                        Button(action: {
                                            
                                        }) {
                                            Rectangle()
                                                .fill(.white)
                                                .frame(width: 45, height: 30)
                                                .overlay {
                                                    Image(systemName: "chevron.right")
                                                        .foregroundStyle(.black)
                                                }
                                                .cornerRadius(20)
                                                .opacity(1)
                                        }
                                        
                                    }
                                    .padding(.horizontal)
                                    .padding(.top)
                                }
                                
                                HStack {
                                    VStack(alignment: .leading, spacing: 10) {
                                        Text("The Perfect Protein")
                                            .InterBold(size: 20)
                                        
                                        Text("The egg white is easily digested, and the yolk contains healthy fats, proteins, and vitamins.")
                                            .InterRegular(size: 14)
                                    }
                                    
                                    Spacer()
                                }
                                .padding(.horizontal)
                                .padding(.top, 5)
                            }
                        }
                 
                        HStack(spacing: 15) {
                            ForEach(0..<3, id: \.self) { index in
                                Circle()
                                    .fill(.orange)
                                    .frame(width: 10, height: 10)
                            }
                        }
                        .padding(.bottom, 10)
                    }
                    .padding(20)
                    
                    HStack(spacing: 30) {
                        Rectangle()
                            .fill(Color(red: 248/255, green: 160/255, blue: 17/255))
                            .overlay {
                                VStack(spacing: 10) {
                                    Image(.timer)
                                        .resizable()
                                        .frame(width: 40, height: 40)
                                    
                                    Text("Quick timer")
                                        .InterBold(size: 18, color: .white)
                                    
                                    Text("Perfect eggs in\nminute")
                                        .InterMedium(size: 16, color: .white)
                                        .multilineTextAlignment(.center)
                                    
                                    Button(action: {
                                        selectedTab = .Cooking
                                    }) {
                                        Rectangle()
                                            .fill(.white)
                                            .overlay {
                                                HStack {
                                                    Image(systemName: "play")
                                                        .foregroundStyle(Color(red: 248/255, green: 160/255, blue: 17/255))
                                                    
                                                    Text("Start Cooking")
                                                        .InterRegular(size: 12, color: Color(red: 248/255, green: 160/255, blue: 17/255))
                                                }
                                            }
                                            .frame(width: 120, height: 30)
                                            .cornerRadius(8)
                                    }
                                }
                            }
                            .frame(width: 150, height: 190)
                            .cornerRadius(8)
                            .shadow(radius: 4)
                        
                        Rectangle()
                            .fill(Color(red: 41/255, green: 204/255, blue: 31/255))
                            .overlay {
                                VStack(spacing: 10) {
                                    Image(.brain)
                                        .resizable()
                                        .frame(width: 40, height: 40)
                                    
                                    Text("Daily Quiz")
                                        .InterBold(size: 18, color: .white)
                                    
                                    Text("Test your bird\nknowledge")
                                        .InterMedium(size: 16, color: .white)
                                        .multilineTextAlignment(.center)
                                    
                                    Button(action: {
                                        selectedTab = .Quiz
                                    }) {
                                        Rectangle()
                                            .fill(.white)
                                            .overlay {
                                                HStack(spacing: 3) {
                                                    Image(systemName: "sparkles")
                                                        .foregroundStyle(Color(red: 41/255, green: 204/255, blue: 31/255))
                                                    
                                                    Text("Take Quiz")
                                                        .InterRegular(size: 12, color: Color(red: 41/255, green: 204/255, blue: 31/255))
                                                }
                                            }
                                            .frame(width: 120, height: 30)
                                            .cornerRadius(8)
                                    }
                                }
                            }
                            .frame(width: 150, height: 190)
                            .cornerRadius(8)
                            .shadow(radius: 4)
                    }
                    
                    Rectangle()
                        .fill(.white)
                        .overlay {
                            VStack {
                                HStack {
                                    Text("Your Progress")
                                        .InterBold(size: 20)
                                    
                                    Spacer()
                                }
                                
                                Spacer()
                                
                                HStack {
                                    VStack {
                                        Text("26")
                                            .InterBold(size: 22, color: Color(red: 248/255, green: 160/255, blue: 17/255))
                                        
                                        Text("Perfect eggs")
                                            .InterMedium(size: 14)
                                    }
                                    
                                    Spacer()
                                    
                                    VStack {
                                        Text("12")
                                            .InterBold(size: 22, color: Color(red: 41/255, green: 204/255, blue: 31/255))
                                        
                                        Text("Quiz Streak")
                                            .InterMedium(size: 14)
                                    }
                                    
                                    Spacer()
                                    
                                    VStack {
                                        Text("48")
                                            .InterBold(size: 22, color: Color(red: 42/255, green: 140/255, blue: 241/255))
                                        
                                        Text("Facts Learned")
                                            .InterMedium(size: 14)
                                    }
                                }
                            }
                            .padding()
                        }
                        .frame(height: 120)
                        .cornerRadius(8)
                        .padding(.horizontal)
                        .padding(.top)
                        .shadow(radius: 4)
                    
                    Color.clear.frame(height: 70)
                }
            }
        }
    }
}

#Preview {
    HomeView(selectedTab: .constant(.Home))
}


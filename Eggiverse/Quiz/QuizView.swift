import SwiftUI

struct QuizView: View {
    @StateObject var quizModel =  QuizViewModel()
    @State private var selected = 0
    let segments = ["Daily Qiiz", "Facts", "Bird Map"]
    
    var body: some View {
        ZStack {
            Color(red: 236/255, green: 252/255, blue: 246/255).ignoresSafeArea()
            
            VStack {
                Image(.quizLabel)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 50)
                
                Text("Discover amazing bird & egg facts")
                    .InterMedium(size: 13)
                    .padding(.top, 10)
                
                Rectangle()
                    .fill(.white)
                    .overlay {
                        VStack {
                            HStack {
                                VStack {
                                    Text("26")
                                        .InterBold(size: 22, color: Color(red: 248/255, green: 160/255, blue: 17/255))
                                    
                                    Text("Day Streak")
                                        .InterMedium(size: 14)
                                }
                                
                                Spacer()
                                
                                VStack {
                                    Text("12")
                                        .InterBold(size: 22, color: Color(red: 41/255, green: 204/255, blue: 31/255))
                                    
                                    Text("XP Points")
                                        .InterMedium(size: 14)
                                }
                                
                                Spacer()
                                
                                VStack {
                                    Text("48")
                                        .InterBold(size: 22, color: Color(red: 42/255, green: 140/255, blue: 241/255))
                                    
                                    Text("Badges")
                                        .InterMedium(size: 14)
                                }
                            }
                            .padding(.horizontal)
                        }
                        .padding()
                    }
                    .frame(height: 80)
                    .cornerRadius(8)
                    .padding(.horizontal)
                    .padding(.top, 5)
                    .shadow(radius: 4)
                
                CustomSegmentedControl(selectedIndex: $selected, titles: segments)
                    .padding([.top, .horizontal])
                
                VStack(spacing: 20) {
                    HStack {
                        Text("Question 1 of 3")
                            .InterRegular(size: 16)
                        
                        Spacer()
                        
                        Image(.cube)
                            .resizable()
                            .frame(width: 20, height: 20)
                        
                        Text("0 correct")
                            .InterBold(size: 16)
                    }
                    .padding(.horizontal)
                    
                    ZStack(alignment: .leading) {
                        Rectangle()
                            .fill(Color(red: 217/255, green: 217/255, blue: 217/255))
                            .frame(height: 12)
                            .cornerRadius(20)
                        
                        Rectangle()
                            .frame(width: 300, height: 12)
                            .cornerRadius(20)
                    }
                    .padding(.horizontal)
                }
                .padding(.top)
                
                switch selected {
                case 0:
                    ScrollView(showsIndicators: false) {
                        Rectangle()
                            .fill(.white)
                            .overlay {
                                VStack {
                                    HStack {
                                        Text("How many chambers does a bird's heart have?")
                                            .InterBold(size: 14)
                                        
                                        Spacer()
                                    }
                                    .padding(.trailing)
                                    
                                    Spacer()
                                    
                                    VStack(spacing: 15) {
                                        ForEach(0..<4, id: \.self) { index in
                                            Rectangle()
                                                .fill(.white)
                                                .overlay {
                                                    Button(action: {
                                                        
                                                    }) {
                                                        RoundedRectangle(cornerRadius: 12)
                                                            .stroke(.gray, lineWidth: 0.5)
                                                            .overlay {
                                                                HStack {
                                                                    Circle()
                                                                        .stroke(.gray, lineWidth: 0.5)
                                                                        .frame(width: 30, height: 30)
                                                                        .overlay {
                                                                            Text("A")
                                                                                .InterMedium(size: 14)
                                                                        }
                                                                    
                                                                    Text("3")
                                                                        .InterMedium(size: 14)
                                                                        .padding(.leading, 15)
                                                                    
                                                                    Spacer()
                                                                }
                                                                .padding(.horizontal)
                                                            }
                                                    }
                                                }
                                                .frame(height: 43)
                                                .cornerRadius(12)
                                        }
                                    }
                                    
                                    Spacer()
                                    
                                    Rectangle()
                                        .fill(Color(red: 41/255, green: 204/255, blue: 31/255))
                                        .overlay {
                                            Text("Submit Answer")
                                                .InterBold(size: 14, color: .white)
                                        }
                                        .frame(height: 40)
                                        .cornerRadius(12)
                                        .padding(.top, 10)
                                }
                                .padding()
                            }
                            .frame(height: 380)
                            .cornerRadius(16)
                            .padding(.horizontal)
                            .padding(.top, 10)
                            .shadow(radius: 5)
                    }
                case 1:
                    ScrollView(showsIndicators: false) {
                        ZStack(alignment: .bottom) {
                            ZStack(alignment: .top) {
                                Rectangle()
                                    .fill(.white)
                                    .frame(height: 275)
                                    .cornerRadius(12)
                                    .shadow(radius: 5)
                                
                                VStack {
                                    ZStack(alignment: .top) {
                                        Image(.mockFact)
                                            .resizable()
                                            .frame(height: 155)
                                        
                                        HStack {
                                            Rectangle()
                                                .fill(.white)
                                                .frame(width: 85, height: 30)
                                                .overlay {
                                                    Text("Anatomy")
                                                        .InterMedium(size: 14)
                                                }
                                                .cornerRadius(20)
                                         
                                            Spacer()
                                        }
                                        .padding(.horizontal)
                                        .padding(.top)
                                    }
                                    
                                    HStack {
                                        VStack(alignment: .leading, spacing: 10) {
                                            VStack(alignment: .leading, spacing: 15) {
                                                Text("The Perfect Protein")
                                                    .InterBold(size: 16)
                                                
                                                Text("25 mins")
                                                    .InterRegular(size: 12)
                                            }
                                        }
                                        
                                        Spacer()
                                    }
                                    .padding(.horizontal)
                                    .padding(.top, 5)
                                }
                            }
                            
                            HStack {
                                Button(action: {
                                    
                                }) {
                                    Rectangle()
                                        .fill(.white)
                                        .frame(width: 110, height: 30)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 12)
                                                .stroke(.black, lineWidth: 0.5)
                                                .overlay {
                                                    Text("Learn More")
                                                        .InterMedium(size: 14)
                                                }
                                        }
                                        .cornerRadius(12)
                                        .padding(.bottom, 10)
                                }
                                
                                Spacer()
                                
                                HStack(spacing: 15) {
                                    Button(action: {
                                        
                                    }) {
                                        Image(.share)
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                    }
                                    
                                    Button(action: {
                                        
                                    }) {
                                        Image(.download)
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                    }
                                }
                            }
                            .padding(.horizontal)
                        }
                        .padding(.horizontal, 20)
                        .padding(.top, 10)
                    }
                case 2:
                    ScrollView(showsIndicators: false) {
                        Rectangle()
                            .fill(.white)
                            .overlay {
                                VStack {
                                    HStack {
                                        Image(.mapPin)
                                            .resizable()
                                            .frame(width: 25, height: 25)
                                        
                                        Text("Global Bird Explorer")
                                            .InterMedium(size: 14)
                                    }
                                    
                                    VStack {
                                        Rectangle()
                                            .fill(LinearGradient(colors: [Color(red: 42/255, green: 140/255, blue: 241/255),
                                                                          Color(red: 156/255, green: 236/255, blue: 150/255)], startPoint: .topLeading, endPoint: .bottomTrailing).opacity(0.5))
                                            .overlay {
                                                VStack {
                                                    Image(.mapPinBlue)
                                                        .resizable()
                                                        .frame(width: 80, height: 80)
                                                    
                                                    VStack(spacing: 10) {
                                                        Text("Interactive Map Coming Soon!")
                                                            .InterBold(size: 14)
                                                        
                                                        Text("Explore bird species from around the world")
                                                            .InterRegular(size: 14)
                                                    }
                                                    .padding(.top, 10)
                                                }
                                            }
                                            .frame(height: 240)
                                            .cornerRadius(12)
                                            .padding(.horizontal)
                                        
                                        HStack(spacing: 30) {
                                            Rectangle()
                                                .fill(Color(red: 42/255, green: 140/255, blue: 241/255).opacity(0.15))
                                                .overlay {
                                                    VStack(spacing: 10) {
                                                        Text("247")
                                                            .InterBold(size: 24, color: Color(red: 42/255, green: 140/255, blue: 241/255))
                                                        
                                                        Text("Species Discovered")
                                                            .InterRegular(size: 14, color: Color(red: 42/255, green: 140/255, blue: 241/255))
                                                            .multilineTextAlignment(.center)
                                                    }
                                                }
                                                .frame(width: 130, height: 140)
                                                .cornerRadius(12)
                                            
                                            Rectangle()
                                                .fill(Color(red: 156/255, green: 236/255, blue: 150/255).opacity(0.15))
                                                .overlay {
                                                    VStack(spacing: 10) {
                                                        Text("32")
                                                            .InterBold(size: 24, color: Color(red: 156/255, green: 236/255, blue: 150/255))
                                                        
                                                        Text("Countries\nExplored")
                                                            .InterRegular(size: 14, color: Color(red: 156/255, green: 236/255, blue: 150/255))
                                                            .multilineTextAlignment(.center)
                                                    }
                                                }
                                                .frame(width: 130, height: 140)
                                                .cornerRadius(12)
                                        }
                                        .padding(.top, 10)
                                    }
                                    .padding(.top, 10)
                                    
                                    Spacer()
                                }
                                .padding(.vertical)
                            }
                            .frame(height: 470)
                            .cornerRadius(12)
                            .shadow(radius: 5)
                            .padding(.horizontal)
                            .padding(.top, 10)
                    }
                default:
                    ScrollView(showsIndicators: false) {
                        Rectangle()
                            .fill(.white)
                            .overlay {
                                VStack {
                                    HStack {
                                        Image(.mapPin)
                                            .resizable()
                                            .frame(width: 25, height: 25)
                                        
                                        Text("Global Bird Explorer")
                                            .InterMedium(size: 14)
                                    }
                                    
                                    VStack {
                                        Rectangle()
                                            .fill(LinearGradient(colors: [Color(red: 42/255, green: 140/255, blue: 241/255),
                                                                          Color(red: 156/255, green: 236/255, blue: 150/255)], startPoint: .topLeading, endPoint: .bottomTrailing).opacity(0.5))
                                            .overlay {
                                                VStack {
                                                    Image(.mapPinBlue)
                                                        .resizable()
                                                        .frame(width: 80, height: 80)
                                                    
                                                    VStack(spacing: 10) {
                                                        Text("Interactive Map Coming Soon!")
                                                            .InterBold(size: 14)
                                                        
                                                        Text("Explore bird species from around the world")
                                                            .InterRegular(size: 14)
                                                    }
                                                    .padding(.top, 10)
                                                }
                                            }
                                            .frame(height: 240)
                                            .cornerRadius(12)
                                            .padding(.horizontal)
                                        
                                        HStack(spacing: 30) {
                                            Rectangle()
                                                .fill(Color(red: 42/255, green: 140/255, blue: 241/255).opacity(0.15))
                                                .overlay {
                                                    VStack(spacing: 10) {
                                                        Text("247")
                                                            .InterBold(size: 24, color: Color(red: 42/255, green: 140/255, blue: 241/255))
                                                        
                                                        Text("Species Discovered")
                                                            .InterRegular(size: 14, color: Color(red: 42/255, green: 140/255, blue: 241/255))
                                                            .multilineTextAlignment(.center)
                                                    }
                                                }
                                                .frame(width: 130, height: 140)
                                                .cornerRadius(12)
                                            
                                            Rectangle()
                                                .fill(Color(red: 156/255, green: 236/255, blue: 150/255).opacity(0.15))
                                                .overlay {
                                                    VStack(spacing: 10) {
                                                        Text("32")
                                                            .InterBold(size: 24, color: Color(red: 156/255, green: 236/255, blue: 150/255))
                                                        
                                                        Text("Countries\nExplored")
                                                            .InterRegular(size: 14, color: Color(red: 156/255, green: 236/255, blue: 150/255))
                                                            .multilineTextAlignment(.center)
                                                    }
                                                }
                                                .frame(width: 130, height: 140)
                                                .cornerRadius(12)
                                        }
                                        .padding(.top, 10)
                                    }
                                    .padding(.top, 10)
                                    
                                    Spacer()
                                }
                                .padding(.vertical)
                            }
                            .frame(height: 470)
                            .cornerRadius(12)
                            .shadow(radius: 5)
                            .padding(.horizontal)
                            .padding(.top, 10)
                    }
                }
            }
        }
    }
}

#Preview {
    QuizView()
}


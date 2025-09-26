import SwiftUI

struct ProgressView: View {
    @StateObject var progressModel =  ProgressViewModel()
    @State private var selected = 0
    let segments = ["Personal", "Flock", "Awards"]
    
    var body: some View {
        ZStack {
            Color(red: 241/255, green: 246/255, blue: 255/255).ignoresSafeArea()
            
            VStack {
                Image(.progressLabel)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 50)
                
                Text("Track your nutrition & flock health")
                    .InterMedium(size: 13)
                    .padding(.top, 10)
                
                CustomSegmentedControl(selectedIndex: $selected, titles: segments)
                    .padding([.top, .horizontal])
                
                switch selected {
                case 0:
                    ScrollView(showsIndicators: false) {
                        VStack {
                            HStack(spacing: 30) {
                                Rectangle()
                                    .fill(LinearGradient(colors: [Color(red: 248/255, green: 160/255, blue: 17/255),
                                                                  Color(red: 244/255, green: 102/255, blue: 103/255)], startPoint: .topLeading, endPoint: .bottomTrailing))
                                    .overlay {
                                        VStack(spacing: 7) {
                                            Image(.emptyEgg)
                                                .resizable()
                                                .frame(width: 40, height: 40)
                                            
                                            Text("18")
                                                .InterBold(size: 24, color: .white)
                                            
                                            Text("Eggs This Week")
                                                .InterRegular(size: 13, color: .white)
                                        }
                                    }
                                    .frame(width: 130, height: 130)
                                    .cornerRadius(8)
                                
                                Rectangle()
                                    .fill(LinearGradient(colors: [Color(red: 42/255, green: 140/255, blue: 241/255),
                                                                  Color(red: 243/255, green: 165/255, blue: 250/255)], startPoint: .topLeading, endPoint: .bottomTrailing))
                                    .overlay {
                                        VStack(spacing: 7) {
                                            Image(.circleCyrcle)
                                                .resizable()
                                                .frame(width: 40, height: 40)
                                            
                                            Text("95 g")
                                                .InterBold(size: 24, color: .white)
                                            
                                            Text("Protein Gained")
                                                .InterRegular(size: 13, color: .white)
                                        }
                                    }
                                    .frame(width: 130, height: 130)
                                    .cornerRadius(8)
                            }
                            
                            Rectangle()
                        }
                        .padding()
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
    ProgressView()
}


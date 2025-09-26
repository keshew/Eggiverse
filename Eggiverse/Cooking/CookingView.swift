import SwiftUI

struct EggType: Identifiable, Hashable {
    var id = UUID().uuidString
    var name: String
    var desc: String
    var color: Color
    var time: Int
}

struct CookingView: View {
    @StateObject var cookingModel =  CookingViewModel()
    @State private var selected = 0
    let segments = ["Timer", "Recipes", "Science"]
    
    var eggs = [EggType(name: "Soft Boiled", desc: "Runny yolk, set white", color: Color(red: 248/255, green: 160/255, blue: 17/255), time: 360),
                EggType(name: "Medium Boiled", desc: "Jammy yolk, firm white", color: Color(red: 242/255, green: 67/255, blue: 69/255), time: 480),
                EggType(name: "Hard Boiled", desc: "Fully set yolk", color: Color(red: 230/255, green: 118/255, blue: 118/255), time: 600)]
    
    var body: some View {
        ZStack {
            Color(red: 254/255, green: 250/255, blue: 233/255).ignoresSafeArea()
            
            VStack {
                Image(.cookLabel)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 50)
                
                Text("Master the art of perfect eggs")
                    .InterMedium(size: 13)
                    .padding(.top, 10)
                
                CustomSegmentedControl(selectedIndex: $selected, titles: segments)
                    .padding([.top, .horizontal])
                
                switch selected {
                case 0:
                    ScrollView(showsIndicators: false) {
                        Rectangle()
                            .fill(.white)
                            .overlay {
                                VStack {
                                    Circle()
                                        .fill(LinearGradient(colors: [Color(red: 255/255, green: 227/255, blue: 127/255),
                                                                      Color(red: 255/255, green: 199/255, blue: 113/255)], startPoint: .top, endPoint: .bottom))
                                        .frame(width: 120, height: 120)
                                        .overlay {
                                            //                                        Text("5:58")
                                            //                                            .InterBold(size: 32, color: Color(red: 148/255, green: 28/255, blue: 27/255))
                                            
                                            Image(.egg)
                                                .resizable()
                                                .frame(width: 100, height: 100)
                                        }
                                    
                                    Spacer()
                                    
                                    ZStack(alignment: .leading) {
                                        Rectangle()
                                            .frame(height: 20)
                                            .cornerRadius(20)
                                    }
                                    
                                    VStack {
                                        Text("Soft Boiled")
                                            .InterBold(size: 16)
                                        
                                        Text("Runny yolk, set white")
                                            .InterRegular(size: 14)
                                    }
                                    .padding(.top, 5)
                                    Spacer()
                                    Text("Select an egg type to start cooking")
                                        .InterRegular(size: 14)
                                    
                                }
                                .padding()
                            }
                            .frame(height: 300)
                            .cornerRadius(16)
                            .padding(.horizontal)
                            .padding(.top, 10)
                            .shadow(radius: 5)
                        
                        VStack {
                            ForEach(eggs, id: \.self) { item in
                                Rectangle()
                                    .fill(.white)
                                    .frame(height: 50)
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(.gray, lineWidth: 0.5)
                                            .overlay {
                                                HStack {
                                                    Circle()
                                                        .fill(item.color)
                                                        .frame(width: 25, height: 25)
                                                    
                                                    VStack(alignment: .leading) {
                                                        Text(item.name)
                                                            .InterBold(size: 14)
                                                        
                                                        Text(item.desc)
                                                            .InterRegular(size: 12)
                                                    }
                                                    
                                                    Spacer()
                                                    
                                                    Image(.clock)
                                                        .resizable()
                                                        .frame(width: 25, height: 25)
                                                    
                                                    Text(formatTime(item.time))
                                                        .InterBold(size: 14)
                                                }
                                                .padding(.horizontal)
                                            }
                                    }
                                    .padding(.horizontal)
                                    .cornerRadius(8)
                            }
                        }
                    }
                case 1:
                    ScrollView(showsIndicators: false) {
                        ZStack(alignment: .bottom) {
                            ZStack(alignment: .top) {
                                Rectangle()
                                    .fill(.white)
                                    .frame(height: 300)
                                    .cornerRadius(12)
                                    .shadow(radius: 5)
                                
                                VStack {
                                    ZStack(alignment: .top) {
                                        Image(.mockFact)
                                            .resizable()
                                            .frame(height: 175)
                                        
                                        HStack {
                                            Spacer()
                                            
                                            Rectangle()
                                                .fill(.white)
                                                .frame(width: 85, height: 30)
                                                .overlay {
                                                    Text("Easy")
                                                        .InterMedium(size: 14)
                                                }
                                                .cornerRadius(20)
                                            
                                        }
                                        .padding(.horizontal)
                                        .padding(.top)
                                    }
                                    
                                    HStack {
                                        VStack(alignment: .leading, spacing: 10) {
                                            HStack {
                                                Text("The Perfect Protein")
                                                    .InterBold(size: 16)
                                                
                                                Spacer()
                                                
                                                Text("25 mins")
                                                    .InterRegular(size: 12)
                                            }
                                            
                                            ScrollView(.horizontal ,showsIndicators: false) {
                                                HStack {
                                                    Rectangle()
                                                        .fill(.white)
                                                        .frame(width: 95, height: 25)
                                                        .overlay {
                                                            RoundedRectangle(cornerRadius: 20)
                                                                .stroke(.black, lineWidth: 0.5)
                                                                .overlay {
                                                                    Text("With Seafood")
                                                                        .InterRegular(size: 12)
                                                                }
                                                        }
                                                        .cornerRadius(20)
                                                    
                                                    Rectangle()
                                                        .fill(.white)
                                                        .frame(width: 65, height: 25)
                                                        .overlay {
                                                            RoundedRectangle(cornerRadius: 20)
                                                                .stroke(.black, lineWidth: 0.5)
                                                                .overlay {
                                                                    Text("Classic")
                                                                        .InterRegular(size: 12)
                                                                }
                                                        }
                                                        .cornerRadius(20)
                                                }
                                            }
                                        }
                                        
                                        Spacer()
                                    }
                                    .padding(.horizontal)
                                    .padding(.top, 5)
                                }
                            }
                            
                            Button(action: {
                                
                            }) {
                                Rectangle()
                                    .fill(.white)
                                    .frame(height: 35)
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(.black, lineWidth: 0.5)
                                            .overlay {
                                                Text("View Recipe")
                                                    .InterBold(size: 14)
                                            }
                                    }
                                    .cornerRadius(12)
                                    .padding(.bottom, 10)
                                    .padding(.horizontal)
                            }
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
                                        Image(.scienceOfEgg)
                                            .resizable()
                                            .frame(width: 25, height: 25)
                                        
                                        Text("The Science of Eggs")
                                            .InterMedium(size: 14)
                                    }
                                    
                                    VStack(spacing: 15) {
                                        Rectangle()
                                            .fill(Color(red: 255/255, green: 241/255, blue: 191/255))
                                            .overlay {
                                                HStack {
                                                    VStack(alignment: .leading, spacing: 15) {
                                                        Text("Protein Coagulation")
                                                            .InterBold(size: 18, color: Color(red: 197/255, green: 166/255, blue: 58/255))
                                                        
                                                        Text("Egg whites start setting at 140°F (60°C), while yolks begin to thicken at 150°F (65°C).")
                                                            .InterRegular(size: 14, color: Color(red: 197/255, green: 166/255, blue: 58/255))
                                                    }
                                                    .padding(.horizontal)
                                                    
                                                    Spacer()
                                                }
                                            }
                                            .frame(height: 110)
                                            .cornerRadius(12)
                                            .padding(.horizontal)
                                        
                                        Rectangle()
                                            .fill(Color(red: 249/255, green: 161/255, blue: 161/255))
                                            .overlay {
                                                HStack {
                                                    VStack(alignment: .leading, spacing: 15) {
                                                        Text("Altitude Matters")
                                                            .InterBold(size: 18, color: Color(red: 190/255, green: 91/255, blue: 91/255))
                                                        
                                                        Text("Water boils at lower temperatures at higher altitudes. Add 1 minute per 1000 feet above sea level.")
                                                            .InterRegular(size: 13, color: Color(red: 190/255, green: 91/255, blue: 91/255))
                                                    }
                                                    .padding(.horizontal)
                                                    
                                                    Spacer()
                                                }
                                            }
                                            .frame(height: 110)
                                            .cornerRadius(12)
                                            .padding(.horizontal)
                                        
                                        Rectangle()
                                            .fill(Color(red: 243/255, green: 186/255, blue: 186/255))
                                            .overlay {
                                                HStack {
                                                    VStack(alignment: .leading, spacing: 15) {
                                                        Text("Age & Freshness")
                                                            .InterBold(size: 18, color: Color(red: 190/255, green: 91/255, blue: 91/255))
                                                        
                                                        Text("Older eggs are actually better for hard-boiling  as they're easier to peel due to higher pH levels.")
                                                            .InterRegular(size: 14, color: Color(red: 190/255, green: 91/255, blue: 91/255))
                                                    }
                                                    .padding(.horizontal)
                                                    
                                                    Spacer()
                                                }
                                            }
                                            .frame(height: 110)
                                            .cornerRadius(12)
                                            .padding(.horizontal)
                                    }
                                    .padding(.top)
                                    
                                    Spacer()
                                }
                                .padding(.vertical)
                            }
                            .frame(height: 440)
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
                                    Circle()
                                        .fill(LinearGradient(colors: [Color(red: 255/255, green: 227/255, blue: 127/255),
                                                                      Color(red: 255/255, green: 199/255, blue: 113/255)], startPoint: .top, endPoint: .bottom))
                                        .frame(width: 120, height: 120)
                                        .overlay {
                                            //                                        Text("5:58")
                                            //                                            .InterBold(size: 32, color: Color(red: 148/255, green: 28/255, blue: 27/255))
                                            
                                            Image(.egg)
                                                .resizable()
                                                .frame(width: 100, height: 100)
                                        }
                                    
                                    Spacer()
                                    
                                    ZStack(alignment: .leading) {
                                        Rectangle()
                                            .frame(height: 20)
                                            .cornerRadius(20)
                                    }
                                    
                                    VStack {
                                        Text("Soft Boiled")
                                            .InterBold(size: 16)
                                        
                                        Text("Runny yolk, set white")
                                            .InterRegular(size: 14)
                                    }
                                    .padding(.top, 5)
                                    Spacer()
                                    Text("Select an egg type to start cooking")
                                        .InterRegular(size: 14)
                                    
                                }
                                .padding()
                            }
                            .frame(height: 300)
                            .cornerRadius(16)
                            .padding(.horizontal)
                            .padding(.top, 10)
                            .shadow(radius: 5)
                        
                        VStack {
                            ForEach(eggs, id: \.self) { item in
                                Rectangle()
                                    .fill(.white)
                                    .frame(height: 50)
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(.gray, lineWidth: 0.5)
                                            .overlay {
                                                HStack {
                                                    Circle()
                                                        .fill(item.color)
                                                        .frame(width: 25, height: 25)
                                                    
                                                    VStack(alignment: .leading) {
                                                        Text(item.name)
                                                            .InterBold(size: 14)
                                                        
                                                        Text(item.desc)
                                                            .InterRegular(size: 12)
                                                    }
                                                    
                                                    Spacer()
                                                    
                                                    Image(.clock)
                                                        .resizable()
                                                        .frame(width: 25, height: 25)
                                                    
                                                    Text(formatTime(item.time))
                                                        .InterBold(size: 14)
                                                }
                                                .padding(.horizontal)
                                            }
                                    }
                                    .padding(.horizontal)
                                    .cornerRadius(8)
                            }
                        }
                    }
                }
            }
        }
    }
    
    func formatTime(_ seconds: Int) -> String {
        let minutes = seconds / 60
        let seconds = seconds % 60
        return String(format: "%d:%02d", minutes, seconds)
    }
}

#Preview {
    CookingView()
}

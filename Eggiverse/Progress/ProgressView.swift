import SwiftUI
import Charts

struct Achiev: Codable, Identifiable {
    var id = UUID().uuidString
    var image: String
    var title: String
    var desc: String
    var currentProgress: Int
    var goalProgress: Int
    var isDone = false
}

struct ProgressView: View {
    @StateObject var progressModel =  ProgressViewModel()
    @State private var selected = 0
    let segments = ["Personal", "Flock", "Awards"]
    let achiv = [Achiev(image: "achiv1", title: "Golden Dozen", desc: "12 perfect eggs this week", currentProgress: 0, goalProgress: 12, isDone: true),
                 Achiev(image: "achiv2", title: "Protein Pro", desc: "Met protein goals 7 days straight", currentProgress: 0, goalProgress: 7),
                 Achiev(image: "hens", title: "Flock Master", desc: "Track 100 flock eggs", currentProgress: 0, goalProgress: 100),
                 Achiev(image: "achiv4", title: "Consistency King", desc: "30-day tracking streak", currentProgress: 0, goalProgress: 30)]
    
    var body: some View {
        ZStack {
            Color(red: 241/255, green: 246/255, blue: 255/255).ignoresSafeArea()
            
            VStack {
                Image(.progressLabel)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 40)
                
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
                                    .frame(width: 140, height: 140)
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
                                    .frame(width: 140, height: 140)
                                    .cornerRadius(8)
                            }
                            
                            Rectangle()
                                .fill(.white)
                                .overlay {
                                    VStack(spacing: 13) {
                                        HStack {
                                            Image(.calendar)
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                            
                                            Text("Log Today's Intake")
                                                .InterRegular(size: 15)
                                            
                                            Spacer()
                                        }
                                        
                                        HStack {
                                            Text("Eggs consumed:")
                                                .InterBold(size: 16)
                                            
                                            Button(action: {
                                                
                                            }) {
                                                Rectangle()
                                                    .fill(.white)
                                                    .overlay {
                                                        RoundedRectangle(cornerRadius: 6)
                                                            .stroke(.gray, lineWidth: 0.5)
                                                            .overlay {
                                                                Text("-")
                                                                    .InterBold(size: 18)
                                                            }
                                                    }
                                                    .frame(width: 30, height: 30)
                                                    .cornerRadius(6)
                                            }
                                            .padding(.leading, 5)
                                            
                                            Text("2")
                                                .InterBold(size: 18)
                                            
                                            Button(action: {
                                                
                                            }) {
                                                Rectangle()
                                                    .fill(.white)
                                                    .overlay {
                                                        RoundedRectangle(cornerRadius: 6)
                                                            .stroke(.gray, lineWidth: 0.5)
                                                            .overlay {
                                                                Text("+")
                                                                    .InterBold(size: 18)
                                                            }
                                                    }
                                                    .frame(width: 30, height: 30)
                                                    .cornerRadius(6)
                                            }
                                            
                                            Spacer()
                                        }
                                        
                                        HStack(spacing: 15) {
                                            Rectangle()
                                                .fill(Color(red: 255/255, green: 241/255, blue: 191/255))
                                                .overlay {
                                                    VStack {
                                                        Text("12 g")
                                                            .InterBold(size: 18, color: Color(red: 197/255, green: 166/255, blue: 58/255))
                                                        
                                                        Text("Protein")
                                                            .InterRegular(size: 14, color: Color(red: 197/255, green: 166/255, blue: 58/255))
                                                    }
                                                    .padding(.horizontal)
                                                }
                                                .frame(height: 55)
                                                .cornerRadius(12)
                                            
                                            Rectangle()
                                                .fill(Color(red: 249/255, green: 161/255, blue: 161/255))
                                                .overlay {
                                                    VStack {
                                                        Text("140kk")
                                                            .InterBold(size: 18, color: Color(red: 190/255, green: 91/255, blue: 91/255))
                                                        
                                                        Text("Calories")
                                                            .InterRegular(size: 13, color: Color(red: 190/255, green: 91/255, blue: 91/255))
                                                    }
                                                }
                                                .frame(height: 55)
                                                .cornerRadius(12)
                                            
                                            Rectangle()
                                                .fill(Color(red: 243/255, green: 186/255, blue: 186/255))
                                                .overlay {
                                                    VStack {
                                                        Text("10 g")
                                                            .InterBold(size: 18, color: Color(red: 190/255, green: 91/255, blue: 91/255))
                                                        
                                                        Text("Fat")
                                                            .InterRegular(size: 13, color: Color(red: 190/255, green: 91/255, blue: 91/255))
                                                    }
                                                }
                                                .frame(height: 55)
                                                .cornerRadius(12)
                                        }
                                        
                                        Rectangle()
                                            .fill(Color(red: 42/255, green: 140/255, blue: 241/255))
                                            .overlay {
                                                Text("+ Log Entry")
                                                    .InterBold(size: 14, color: .white)
                                                .padding(.horizontal)
                                            }
                                            .frame(height: 40)
                                            .cornerRadius(12)
                                    }
                                    .padding(.horizontal)
                                }
                                .frame(height: 210)
                                .cornerRadius(8)
                                .padding(.horizontal, 30)
                                .shadow(radius: 5)
                                .padding(.top, 10)
                            
                            WeeklyBarChartView()
                            
                            NutritionDonutChart()
                            
                            Color.clear.frame(height: 60)
                        }
                        .padding()
                    }
                case 1:
                    ScrollView(showsIndicators: false) {
                        VStack {
                            HStack(spacing: 30) {
                                Rectangle()
                                    .fill(LinearGradient(colors: [Color(red: 41/255, green: 204/255, blue: 31/255),
                                                                  Color(red: 101/255, green: 244/255, blue: 106/255)], startPoint: .topLeading, endPoint: .bottomTrailing))
                                    .overlay {
                                        VStack(spacing: 7) {
                                            Image(.hens)
                                                .resizable()
                                                .frame(width: 40, height: 40)
                                            
                                            Text("8")
                                                .InterBold(size: 24, color: .white)
                                            
                                            Text("Active Hens")
                                                .InterRegular(size: 13, color: .white)
                                        }
                                    }
                                    .frame(width: 140, height: 140)
                                    .cornerRadius(8)
                                
                                Rectangle()
                                    .fill(LinearGradient(colors: [Color(red: 248/255, green: 160/255, blue: 17/255),
                                                                  Color(red: 255/255, green: 191/255, blue: 88/255)], startPoint: .topLeading, endPoint: .bottomTrailing))
                                    .overlay {
                                        VStack(spacing: 7) {
                                            Image(.egg2)
                                                .resizable()
                                                .frame(width: 40, height: 40)
                                            
                                            Text("77")
                                                .InterBold(size: 24, color: .white)
                                            
                                            Text("Weekly Total")
                                                .InterRegular(size: 13, color: .white)
                                        }
                                    }
                                    .frame(width: 140, height: 140)
                                    .cornerRadius(8)
                            }
                            
                            Rectangle()
                                .fill(.white)
                                .overlay {
                                    VStack(spacing: 13) {
                                        HStack {
                                            Text("Today's Egg Collection")
                                                .InterRegular(size: 13)
                                            
                                            Spacer()
                                        }
                                        
                                        HStack {
                                            Text("Eggs consumed:")
                                                .InterBold(size: 16)
                                            
                                            Button(action: {
                                                
                                            }) {
                                                Rectangle()
                                                    .fill(.white)
                                                    .overlay {
                                                        RoundedRectangle(cornerRadius: 6)
                                                            .stroke(.gray, lineWidth: 0.5)
                                                            .overlay {
                                                                Text("-")
                                                                    .InterBold(size: 18)
                                                            }
                                                    }
                                                    .frame(width: 30, height: 30)
                                                    .cornerRadius(6)
                                            }
                                            .padding(.leading, 5)
                                            
                                            Text("2")
                                                .InterBold(size: 18)
                                            
                                            Button(action: {
                                                
                                            }) {
                                                Rectangle()
                                                    .fill(.white)
                                                    .overlay {
                                                        RoundedRectangle(cornerRadius: 6)
                                                            .stroke(.gray, lineWidth: 0.5)
                                                            .overlay {
                                                                Text("+")
                                                                    .InterBold(size: 18)
                                                            }
                                                    }
                                                    .frame(width: 30, height: 30)
                                                    .cornerRadius(6)
                                            }
                                            
                                            Spacer()
                                        }
                                        
                                        Rectangle()
                                            .fill(Color(red: 41/255, green: 204/255, blue: 31/255))
                                            .overlay {
                                                Text("+ Record Collection")
                                                    .InterBold(size: 14, color: .white)
                                                .padding(.horizontal)
                                            }
                                            .frame(height: 40)
                                            .cornerRadius(12)
                                    }
                                    .padding(.horizontal)
                                }
                                .frame(height: 150)
                                .cornerRadius(8)
                                .padding(.horizontal, 30)
                                .shadow(radius: 5)
                                .padding(.top, 10)
                            
                            Rectangle()
                                .fill(.white)
                                .overlay {
                                    VStack(spacing: 13) {
                                        HStack {
                                            Text("Today's Hens ")
                                                .InterRegular(size: 13)
                                            
                                            Spacer()
                                        }
                                        
                                        HStack {
                                            Text("Additional Hens:")
                                                .InterBold(size: 16)
                                            
                                            Button(action: {
                                                
                                            }) {
                                                Rectangle()
                                                    .fill(.white)
                                                    .overlay {
                                                        RoundedRectangle(cornerRadius: 6)
                                                            .stroke(.gray, lineWidth: 0.5)
                                                            .overlay {
                                                                Text("-")
                                                                    .InterBold(size: 18)
                                                            }
                                                    }
                                                    .frame(width: 30, height: 30)
                                                    .cornerRadius(6)
                                            }
                                            .padding(.leading, 5)
                                            
                                            Text("2")
                                                .InterBold(size: 18)
                                            
                                            Button(action: {
                                                
                                            }) {
                                                Rectangle()
                                                    .fill(.white)
                                                    .overlay {
                                                        RoundedRectangle(cornerRadius: 6)
                                                            .stroke(.gray, lineWidth: 0.5)
                                                            .overlay {
                                                                Text("+")
                                                                    .InterBold(size: 18)
                                                            }
                                                    }
                                                    .frame(width: 30, height: 30)
                                                    .cornerRadius(6)
                                            }
                                            
                                            Spacer()
                                        }
                                        
                                        Rectangle()
                                            .fill(Color(red: 41/255, green: 204/255, blue: 31/255))
                                            .overlay {
                                                Text("+ Record Hens")
                                                    .InterBold(size: 14, color: .white)
                                                .padding(.horizontal)
                                            }
                                            .frame(height: 40)
                                            .cornerRadius(12)
                                    }
                                    .padding(.horizontal)
                                }
                                .frame(height: 150)
                                .cornerRadius(8)
                                .padding(.horizontal, 30)
                                .shadow(radius: 5)
                                .padding(.top, 10)
                            
                            EggsCharts()
                            
                            Color.clear.frame(height: 60)
                        }
                        .padding()
                    }
                case 2:
                    ScrollView(showsIndicators: false) {
                        VStack {
                            VStack(spacing: 15) {
                                ForEach(achiv, id: \.id) { item in
                                    Rectangle()
                                        .fill(item.isDone ? Color(red: 242/255, green: 255/255, blue: 141/255) : .white)
                                        .overlay {
                                            VStack(spacing: 10) {
                                                HStack {
                                                    Image(item.image)
                                                        .resizable()
                                                        .frame(width: 30, height: 30)
                                                        .grayscale(item.isDone ? 0 : 1)
                                                    VStack(alignment: .leading, spacing: 3) {
                                                        Text(item.title)
                                                            .InterBold(size: 15, color: item.isDone ? Color(red: 139/255, green: 92/255, blue: 18/255) : Color(red: 96/255, green: 89/255, blue: 89/255))
                                                        
                                                        Text(item.desc)
                                                            .InterMedium(size: 12, color: item.isDone ? Color(red: 139/255, green: 92/255, blue: 18/255) : Color(red: 96/255, green: 89/255, blue: 89/255))
                                                    }
                                                    .padding(.leading, 3)
                                                        
                                                    Spacer()
                                                    
                                                    if item.isDone {
                                                        Image("madeAchiev")
                                                            .resizable()
                                                            .frame(width: 30, height: 30)
                                                    }
                                                }
                                                .padding(.horizontal)
                                                
                                                if item.isDone {
                                                    Rectangle()
                                                        .fill(Color(red: 255/255, green: 180/255, blue: 56/255))
                                                        .frame(height: 15)
                                                        .cornerRadius(13)
                                                        .padding(.horizontal)
                                                }
                                            }
                                        }
                                        .frame(height: 80)
                                        .cornerRadius(8)
                                        .shadow(radius: 5)
                                }
                                
                                Rectangle()
                                    .fill(.white)
                                    .overlay {
                                        VStack {
                                            HStack {
                                                Text("Your Progress")
                                                    .InterRegular(size: 18)
                                                
                                                Spacer()
                                            }
                                            
                                            Spacer()
                                            
                                            HStack {
                                                Rectangle()
                                                    .fill(Color(red: 254/255, green: 160/255, blue: 233/255).opacity(0.5))
                                                    .overlay {
                                                        VStack(spacing: 5) {
                                                            Text("Level 5")
                                                                .InterBold(size: 18, color: Color(red: 203/255, green: 17/255, blue: 183/255))
                                                            
                                                            Text("Egg Enthusiast")
                                                                .InterRegular(size: 12, color: Color(red: 203/255, green: 17/255, blue: 183/255))
                                                        }
                                                    }
                                                    .frame(width: 140, height: 70)
                                                    .cornerRadius(8)
                                                
                                                Spacer()
                                                
                                                Rectangle()
                                                    .fill(Color(red: 42/255, green: 140/255, blue: 241/255).opacity(0.15))
                                                    .overlay {
                                                        VStack(spacing: 5) {
                                                            Text("1345")
                                                                .InterBold(size: 18, color: Color(red: 42/255, green: 140/255, blue: 241/255))
                                                            
                                                            Text("Total XP")
                                                                .InterRegular(size: 12, color: Color(red: 42/255, green: 140/255, blue: 241/255))
                                                        }
                                                    }
                                                    .frame(width: 140, height: 70)
                                                    .cornerRadius(8)
                                            }
                                            
                                            Spacer()
                                            
                                            VStack(spacing: 10) {
                                                HStack {
                                                    Text("Progress to Level 6")
                                                        .InterRegular(size: 14)
                                                    
                                                    Spacer()
                                                    
                                                    Text("847 / 1500 XP")
                                                        .InterRegular(size: 14)
                                                }
                                                
                                                ZStack(alignment: .leading) {
                                                    Rectangle()
                                                        .fill(Color(red: 217/255, green: 217/255, blue: 217/255))
                                                        .frame(height: 12)
                                                        .cornerRadius(20)
                                                    
                                                    Rectangle()
                                                        .frame(width: 300, height: 12)
                                                        .cornerRadius(20)
                                                }
                                            }
                                        }
                                        .padding()
                                    }
                                    .frame(height: 190)
                                    .cornerRadius(8)
                                    .shadow(radius: 5)
                            }
                            
                            Color.clear.frame(height: 70)
                        }
                        .padding(.horizontal)
                        .padding(.top, 10)
                    }
                default:
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
                                    .frame(width: 140, height: 140)
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
                                    .frame(width: 140, height: 140)
                                    .cornerRadius(8)
                            }
                            
                            Rectangle()
                                .fill(.white)
                                .overlay {
                                    VStack(spacing: 13) {
                                        HStack {
                                            Image(.calendar)
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                            
                                            Text("Log Today's Intake")
                                                .InterRegular(size: 15)
                                            
                                            Spacer()
                                        }
                                        
                                        HStack {
                                            Text("Eggs consumed:")
                                                .InterBold(size: 16)
                                            
                                            Button(action: {
                                                
                                            }) {
                                                Rectangle()
                                                    .fill(.white)
                                                    .overlay {
                                                        RoundedRectangle(cornerRadius: 6)
                                                            .stroke(.gray, lineWidth: 0.5)
                                                            .overlay {
                                                                Text("-")
                                                                    .InterBold(size: 18)
                                                            }
                                                    }
                                                    .frame(width: 30, height: 30)
                                                    .cornerRadius(6)
                                            }
                                            .padding(.leading, 5)
                                            
                                            Text("2")
                                                .InterBold(size: 18)
                                            
                                            Button(action: {
                                                
                                            }) {
                                                Rectangle()
                                                    .fill(.white)
                                                    .overlay {
                                                        RoundedRectangle(cornerRadius: 6)
                                                            .stroke(.gray, lineWidth: 0.5)
                                                            .overlay {
                                                                Text("+")
                                                                    .InterBold(size: 18)
                                                            }
                                                    }
                                                    .frame(width: 30, height: 30)
                                                    .cornerRadius(6)
                                            }
                                            
                                            Spacer()
                                        }
                                        
                                        HStack(spacing: 15) {
                                            Rectangle()
                                                .fill(Color(red: 255/255, green: 241/255, blue: 191/255))
                                                .overlay {
                                                    VStack {
                                                        Text("12 g")
                                                            .InterBold(size: 18, color: Color(red: 197/255, green: 166/255, blue: 58/255))
                                                        
                                                        Text("Protein")
                                                            .InterRegular(size: 14, color: Color(red: 197/255, green: 166/255, blue: 58/255))
                                                    }
                                                    .padding(.horizontal)
                                                }
                                                .frame(height: 55)
                                                .cornerRadius(12)
                                            
                                            Rectangle()
                                                .fill(Color(red: 249/255, green: 161/255, blue: 161/255))
                                                .overlay {
                                                    VStack {
                                                        Text("140kk")
                                                            .InterBold(size: 18, color: Color(red: 190/255, green: 91/255, blue: 91/255))
                                                        
                                                        Text("Calories")
                                                            .InterRegular(size: 13, color: Color(red: 190/255, green: 91/255, blue: 91/255))
                                                    }
                                                }
                                                .frame(height: 55)
                                                .cornerRadius(12)
                                            
                                            Rectangle()
                                                .fill(Color(red: 243/255, green: 186/255, blue: 186/255))
                                                .overlay {
                                                    VStack {
                                                        Text("10 g")
                                                            .InterBold(size: 18, color: Color(red: 190/255, green: 91/255, blue: 91/255))
                                                        
                                                        Text("Fat")
                                                            .InterRegular(size: 13, color: Color(red: 190/255, green: 91/255, blue: 91/255))
                                                    }
                                                }
                                                .frame(height: 55)
                                                .cornerRadius(12)
                                        }
                                        
                                        Rectangle()
                                            .fill(Color(red: 42/255, green: 140/255, blue: 241/255))
                                            .overlay {
                                                Text("+ Log Entry")
                                                    .InterBold(size: 14, color: .white)
                                                .padding(.horizontal)
                                            }
                                            .frame(height: 40)
                                            .cornerRadius(12)
                                    }
                                    .padding(.horizontal)
                                }
                                .frame(height: 210)
                                .cornerRadius(8)
                                .padding(.horizontal, 30)
                                .shadow(radius: 5)
                                .padding(.top, 10)
                            
                            WeeklyBarChartView()
                            
                            NutritionDonutChart()
                        }
                        .padding()
                    }
                }
            }
        }
    }
}

#Preview {
    ProgressView()
}

struct WeeklyBarChartView: View {
    let data = [4, 3, 5, 2, 6, 4, 3]
    let days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
    
    var maxValue: Int {
        data.max() ?? 1
    }
    
    var body: some View {
        Rectangle()
            .fill(Color.white)
            .overlay {
                VStack(alignment: .leading, spacing: 0) {
                    Text("Weekly Consumption")
                        .InterRegular(size: 14)
                        .padding(.bottom, 12)
                    
                    HStack(alignment: .bottom, spacing: 18) {
                        ForEach(data.indices, id: \.self) { index in
                            VStack {
                                Text("\(data[index])")
                                    .InterRegular(size: 12)
                                
                                Rectangle()
                                    .fill(Color(red: 242/255, green: 255/255, blue: 141/255))
                                    .frame(
                                        width: 24,
                                        height: CGFloat(data[index]) / CGFloat(maxValue) * 100
                                    )
                                
                                Text(days[index])
                                    .font(.caption2)
                                    .foregroundColor(.gray)
                                    .padding(.top, 6)
                            }
                        }
                    }
                    .frame(height: 148, alignment: .bottom)
                }
                .padding(.horizontal)
            }
            .frame(height: 210)
            .cornerRadius(8)
            .padding(.horizontal, 30)
            .shadow(radius: 5)
            .padding(.top, 10)
    }
}

struct NutritionDonutChart: View {
    let data: [Double] = [35, 28, 12, 25]
    let colors: [Color] = [Color(red: 242/255, green: 67/255, blue: 69/255), Color(red: 41/255, green: 204/255, blue: 31/255),
                           Color(red: 242/255, green: 255/255, blue: 141/255), Color(red: 42/255, green: 140/255, blue: 241/255)]
    let labels: [String] = ["Protein 35%", "Healthy Fats 28%", "Minerals 12%", "Vitamins 25%"]

    var body: some View {
        Rectangle()
            .fill(Color.white)
            .overlay {
                HStack(spacing: 20) {
                    ZStack {
                        DonutChart(data: data, colors: colors)
                            .frame(width: 80, height: 80)
                    }
                    .padding(.trailing, 18)
                    .padding(.leading)

                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(0..<data.count, id: \.self) { i in
                            HStack {
                                Circle()
                                    .fill(colors[i])
                                    .frame(width: 12, height: 12)
                                Text(labels[i])
                                    .InterRegular(size: 10)
                            }
                        }
                    }
                    
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top, 16)
                VStack {
                    HStack {
                        Text("Nutrition Breakdown")
                            .InterBold(size: 14)
                        
                        Spacer()
                    }
                    Spacer()
                }.padding(.horizontal)
                    .padding(.top, 20)
            }
            .frame(height: 210)
            .cornerRadius(8)
            .padding(.horizontal, 30)
            .shadow(radius: 5)
            .padding(.top, 10)
    }
}

struct DonutChart: View {
    let data: [Double]
    let colors: [Color]

    var total: Double {
        data.reduce(0, +)
    }

    var segments: [Double] {
        var sum: Double = 0
        return data.map { item in
            defer { sum += item }
            return sum / total
        }
    }

    var body: some View {
        ZStack {
            ForEach(0..<data.count, id: \.self) { i in
                Circle()
                    .trim(from: segments[i], to: segments[i] + data[i] / total)
                    .stroke(colors[i], style: StrokeStyle(lineWidth: 28, lineCap: .butt))
                    .rotationEffect(.degrees(-90))
            }
        }
    }
}

struct EggsCharts: View {
    let data = [4, 3, 5, 2, 6, 4, 3]
    let days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
    
    var maxValue: Int {
        data.max() ?? 1
    }
    
    var body: some View {
        Rectangle()
            .fill(Color.white)
            .overlay {
                VStack(alignment: .leading, spacing: 0) {
                    
                    HStack(alignment: .bottom, spacing: 18) {
                        ForEach(data.indices, id: \.self) { index in
                            VStack {
                                Text("\(data[index])")
                                    .InterRegular(size: 12)
                                
                                Rectangle()
                                    .fill(Color(red: 156/255, green: 236/255, blue: 150/255))
                                    .frame(
                                        width: 24,
                                        height: CGFloat(data[index]) / CGFloat(maxValue) * 100
                                    )
                                
                                Text(days[index])
                                    .font(.caption2)
                                    .foregroundColor(.gray)
                                    .padding(.top, 6)
                            }
                        }
                    }
                    .frame(height: 148, alignment: .bottom)
                }
                .padding(.horizontal)
            }
            .frame(height: 180)
            .cornerRadius(8)
            .padding(.horizontal, 30)
            .shadow(radius: 5)
            .padding(.top, 10)
    }
}

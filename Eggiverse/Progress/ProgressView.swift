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
    @State var achiv = [Achiev(image: "achiv1", title: "Golden Dozen", desc: "12 perfect eggs this week", currentProgress: UserDefaultsManager.shared.totalEggsCount(for: "totalEggs"), goalProgress: 12),
                 Achiev(image: "achiv2", title: "Protein Pro", desc: "Met protein goals 7 days straight", currentProgress: UserDefaultsManager.shared.consecutiveDaysEggs(for: "todayEggs"), goalProgress: 7),
                 Achiev(image: "hens", title: "Flock Master", desc: "Track 100 flock eggs", currentProgress: UserDefaultsManager.shared.totalEggsCount(for: "totalEggs"), goalProgress: 100),
                 Achiev(image: "achiv4", title: "Consistency King", desc: "30-day tracking streak", currentProgress: UserDefaultsManager.shared.consecutiveDaysEggs(for: "todayEggs"), goalProgress: 30)]
    @State var eggConsumed = 0
    @State var hensConsumed = 0
    
    func updateAchievements(_ achievements: inout [Achiev]) {
        for i in 0..<achievements.count {
            let item = achievements[i]
            switch item.title {
            case "Golden Dozen":
                let progress = UserDefaultsManager.shared.totalEggsCount(for: "todayEggs")
                achievements[i].currentProgress = progress
                achievements[i].isDone = progress >= 12

            case "Protein Pro":
                let streak = UserDefaultsManager.shared.consecutiveDaysEggs(for: "todayEggs")
                achievements[i].currentProgress = streak
                achievements[i].isDone = streak >= 7

            case "Flock Master":
                let progress = UserDefaultsManager.shared.totalEggsCount(for: "todayEggs")
                achievements[i].currentProgress = progress
                achievements[i].isDone = progress >= 100

            case "Consistency King":
                let streak = UserDefaultsManager.shared.consecutiveDaysEggs(for: "todayEggs")
                achievements[i].currentProgress = streak
                achievements[i].isDone = streak >= 30

            default:
                break
            }
        }
    }

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
                                            
                                            Text("\(UserDefaultsManager.shared.totalEggsForLastWeek())")
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
                                            
                                            Text("\(UserDefaultsManager.shared.totalEggsForLastWeek() * 6) g")
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
                                                if eggConsumed > 0 {
                                                    eggConsumed -= 1
                                                }
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
                                            
                                            Text("\(eggConsumed)")
                                                .InterBold(size: 18)
                                            
                                            Button(action: {
                                                eggConsumed += 1
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
                                                        Text("\(eggConsumed * 6) g")
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
                                                        Text("\(eggConsumed * 70)kk")
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
                                                        Text("\(eggConsumed * 5) g")
                                                            .InterBold(size: 18, color: Color(red: 190/255, green: 91/255, blue: 91/255))
                                                        
                                                        Text("Fat")
                                                            .InterRegular(size: 13, color: Color(red: 190/255, green: 91/255, blue: 91/255))
                                                    }
                                                }
                                                .frame(height: 55)
                                                .cornerRadius(12)
                                        }
                                        
                                        Button(action: {
                                            UserDefaultsManager.shared.addEggsCount(eggConsumed, for: "todayEggs")
                                            UserDefaultsManager.shared.addXP(10)
                                            eggConsumed = 0
                                        }) {
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
                                            
                                            Text("\(UserDefaultsManager.shared.totalHensCount())")
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
                                            
                                            Text("\(UserDefaultsManager.shared.totalEggsForLastWeek())")
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
                                                if eggConsumed > 0 {
                                                    eggConsumed -= 1
                                                }
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
                                            
                                            Text("\(eggConsumed)")
                                                .InterBold(size: 18)
                                            
                                            Button(action: {
                                                eggConsumed += 1
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
                                        
                                        Button(action: {
                                            UserDefaultsManager.shared.addEggsCount(eggConsumed, for: "todayEggs")
                                            UserDefaultsManager.shared.addXP(7)
                                            eggConsumed = 0
                                        }) {
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
                                                if hensConsumed > 0 {
                                                    hensConsumed -= 1
                                                }
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
                                            
                                            Text("\(hensConsumed)")
                                                .InterBold(size: 18)
                                            
                                            Button(action: {
                                                    hensConsumed += 1
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
                                        
                                        Button(action: {
                                            UserDefaultsManager.shared.addHensCount(hensConsumed, for: "hens_today")
                                            UserDefaultsManager.shared.addXP(10)
                                            hensConsumed = 0
                                        }) {
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
                                            let currentXP = UserDefaultsManager.shared.getXP()
                                            let currentLevel = UserDefaultsManager.shared.getLevel()
                                            let maxXPPerLevel = 1500
                                            let xpInCurrentLevel = currentXP % maxXPPerLevel
                                            
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
                                                            Text("Level \(currentLevel + 1)")
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
                                                            Text("\(currentXP)")
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
                                                    Text("Progress to Level \(currentLevel + 2)")
                                                        .InterRegular(size: 14)
                                                    
                                                    Spacer()
                                                    
                                                    Text("\(xpInCurrentLevel) / \(maxXPPerLevel) XP")
                                                        .InterRegular(size: 14)
                                                }
                                                
                                                XPProgressBar(currentXP: currentXP)
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
                        .onAppear {
                            updateAchievements(&achiv)
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
                                            
                                            Text("\(UserDefaultsManager.shared.totalEggsForLastWeek())")
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
                                            
                                            Text("\(UserDefaultsManager.shared.totalEggsForLastWeek() * 6) g")
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
                                                if eggConsumed > 0 {
                                                    eggConsumed -= 1
                                                }
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
                                            
                                            Text("\(eggConsumed)")
                                                .InterBold(size: 18)
                                            
                                            Button(action: {
                                                eggConsumed += 1
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
                                                        Text("\(eggConsumed * 6) g")
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
                                                        Text("\(eggConsumed * 70)kk")
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
                                                        Text("\(eggConsumed * 5) g")
                                                            .InterBold(size: 18, color: Color(red: 190/255, green: 91/255, blue: 91/255))
                                                        
                                                        Text("Fat")
                                                            .InterRegular(size: 13, color: Color(red: 190/255, green: 91/255, blue: 91/255))
                                                    }
                                                }
                                                .frame(height: 55)
                                                .cornerRadius(12)
                                        }
                                        
                                        Button(action: {
                                            UserDefaultsManager.shared.addEggsCount(eggConsumed, for: "todayEggs")
                                            UserDefaultsManager.shared.addXP(10)
                                            eggConsumed = 0
                                        }) {
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
                }
            }
        }
    }
}

#Preview {
    ProgressView()
}

struct WeeklyBarChartView: View {
    let data = UserDefaultsManager.shared.valuesForLast7Days()
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
                                let safeMax = maxValue > 0 ? maxValue : 1
                                let safeValue = max(data[index], 0)
                                
                                Text("\(data[index])")
                                    .InterRegular(size: 12)
                                
                                Rectangle()
                                    .fill(Color(red: 242/255, green: 255/255, blue: 141/255))
                                    .frame(
                                        width: 24,
                                        height: CGFloat(safeValue) / CGFloat(safeMax) * 100
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
    let colors: [Color] = [Color(red: 242/255, green: 67/255, blue: 69/255), Color(red: 41/255, green: 204/255, blue: 31/255),
                           Color(red: 242/255, green: 255/255, blue: 141/255), Color(red: 42/255, green: 140/255, blue: 241/255)]
    let data: [Double] = [35, 28, 12, 25]
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
    let data: [Int] = UserDefaultsManager.shared.valuesForLast7Days(filterKeyPrefix: "hens")
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
                                let safeMax = maxValue > 0 ? maxValue : 1
                                let safeValue = max(data[index], 0)
                                
                                Text("\(data[index])")
                                    .InterRegular(size: 12)
                                
                                Rectangle()
                                    .fill(Color(red: 156/255, green: 236/255, blue: 150/255))
                                .frame(
                                    width: 24,
                                    height: CGFloat(safeValue) / CGFloat(safeMax) * 100
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

class UserDefaultsManager {
    static let shared = UserDefaultsManager()
    private let key = "intDictWithDate"
    private let xpKey = "userXP"
    
     var userDefaults: UserDefaults {
        UserDefaults.standard
    }

    func totalEggsCount(for key: String) -> Int {
         let dict = getDict()
         return dict[key]?.count ?? 0
     }

     func consecutiveDaysEggs(for key: String) -> Int {
         let dict = getDict()
         let calendar = Calendar.current
         
         let dates = dict.filter { $0.key == key && $0.value.count > 0 }
             .map { calendar.startOfDay(for: $0.value.date) }
             .sorted(by: >)
         
         guard !dates.isEmpty else { return 0 }
         
         var streak = 1
         for i in 1..<dates.count {
             let previousDay = calendar.date(byAdding: .day, value: -1, to: dates[i-1])!
             if dates[i] == previousDay {
                 streak += 1
             } else {
                 break
             }
         }
         return streak
     }
    
    func totalHensCount() -> Int {
        let dict = getDict()
        let hensValues = dict.filter { $0.key.hasPrefix("hens") }
        return hensValues.reduce(0) { $0 + $1.value.count }
    }
    
    private func groupedByDay(filterKeyPrefix: String? = nil) -> [Date: Int] {
        let dict = getDict()
        let calendar = Calendar.current

        var dayCounts: [Date: Int] = [:]
        for (key, value) in dict {
            if let prefix = filterKeyPrefix, !key.hasPrefix(prefix) {
                continue
            }
            let day = calendar.startOfDay(for: value.date)
            dayCounts[day, default: 0] += value.count
        }
        return dayCounts
    }

    func valuesForLast7Days(filterKeyPrefix: String? = nil) -> [Int] {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())

        let dayCounts = groupedByDay(filterKeyPrefix: filterKeyPrefix)
        var results: [Int] = []

        for i in 0..<7 {
            if let date = calendar.date(byAdding: .day, value: -i, to: today) {
                let count = dayCounts[date] ?? 0
                results.append(count)
            }
        }
        return results.reversed()
    }

    func addHensCount(_ amount: Int, for key: String) {
        var dict = getDict()
        if let current = dict[key] {
            let newCount = current.count + amount
            dict[key] = (newCount, Date())
        } else {
            dict[key] = (amount, Date())
        }
        saveDict(dict)
    }

    private func saveDict(_ dict: [String: (count: Int, date: Date)]) {
        let encoded = dict.mapValues { ["count": $0.count, "date": $0.date.timeIntervalSince1970] }
        userDefaults.set(encoded, forKey: key)
    }

    private func getDict() -> [String: (count: Int, date: Date)] {
        guard let saved = userDefaults.dictionary(forKey: key) as? [String: [String: Double]] else {
            return [:]
        }

        var dict: [String: (count: Int, date: Date)] = [:]
        for (k, v) in saved {
            let count = Int(v["count"] ?? 0)
            let time = v["date"] ?? 0
            dict[k] = (count, Date(timeIntervalSince1970: time))
        }
        return dict
    }

    func incrementValue(for key: String, by amount: Int) {
        var dict = getDict()
        if let current = dict[key] {
            let newCount = current.count + amount
            let newDate = Date()
            dict[key] = (newCount, newDate)
        } else {
            dict[key] = (amount, Date())
        }
        saveDict(dict)
    }

    private func groupedByDay() -> [Date: Int] {
        let dict = getDict()
        let calendar = Calendar.current

        var dayCounts: [Date: Int] = [:]
        for (_, value) in dict {
            let day = calendar.startOfDay(for: value.date)
            dayCounts[day, default: 0] += value.count
        }
        return dayCounts
    }

    func valuesForLast7Days() -> [Int] {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())

        let dayCounts = groupedByDay()
        var results: [Int] = []

        for i in 0..<7 {
            if let date = calendar.date(byAdding: .day, value: -i, to: today) {
                let count = dayCounts[date] ?? 0
                results.append(count)
            }
        }

        return results.reversed()
    }

    func value(for key: String) -> Int {
        let dict = getDict()
        return dict[key]?.count ?? 0
    }
    
    func addEggsCount(_ amount: Int, for key: String) {
        var dict = getDict()
        if let current = dict[key] {
            let newCount = current.count + amount
            dict[key] = (newCount, Date())
        } else {
            dict[key] = (amount, Date())
        }
        saveDict(dict)
    }
    
    func totalEggsForLastWeek() -> Int {
        let last7daysValues = valuesForLast7Days()
        return last7daysValues.reduce(0, +)
    }
}

extension UserDefaultsManager {
    func addXP(_ amount: Int) {
        let currentXP = getXP()
        let newXP = currentXP + amount
        userDefaults.set(newXP, forKey: xpKey)
    }

    func getXP() -> Int {
        userDefaults.integer(forKey: xpKey)
    }

    func getLevel(maxXPPerLevel: Int = 1500) -> Int {
        let xp = getXP()
        return xp / maxXPPerLevel
    }

    func getProgressToNextLevel(maxXPPerLevel: Int = 1500) -> Double {
        let xp = getXP()
        let remainder = xp % maxXPPerLevel
        return Double(remainder) / Double(maxXPPerLevel)
    }
}

struct XPProgressBar: View {
    let currentXP: Int
    let maxXPPerLevel: Int = 1500
    let maxWidth: CGFloat = 340

    var progressInCurrentLevel: Int {
        currentXP % maxXPPerLevel
    }

    var progressWidth: CGFloat {
        maxWidth * CGFloat(progressInCurrentLevel) / CGFloat(maxXPPerLevel)
    }

    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .fill(Color(red: 217/255, green: 217/255, blue: 217/255))
                .frame(width: maxWidth, height: 12)
                .cornerRadius(20)

            Rectangle()
                .frame(width: progressWidth, height: 12)
                .cornerRadius(20)
        }
    }
}

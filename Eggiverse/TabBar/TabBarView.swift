import SwiftUI

struct TabBarView: View {
    @StateObject var TabBarModel =  TabBarViewModel()
    @State private var selectedTab: CustomTabBar.TabType = .Home
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                if selectedTab == .Home {
                    HomeView(selectedTab: $selectedTab)
                } else if selectedTab == .Cooking {
                    CookingView()
                } else if selectedTab == .Quiz {
                    QuizView()
                } else if selectedTab == .Progress {
                    ProgressView()
                }
            }
            .frame(maxHeight: .infinity)
            .safeAreaInset(edge: .bottom) {
                Color.clear.frame(height: 0)
            }
            
            CustomTabBar(selectedTab: $selectedTab)
        }
        .ignoresSafeArea(.keyboard)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    TabBarView()
}

struct CustomTabBar: View {
    @Binding var selectedTab: TabType
    
    enum TabType: Int {
        case Home
        case Cooking
        case Quiz
        case Progress
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack {
                ZStack(alignment: .top) {
                    Rectangle()
                        .fill(.white)
                        .frame(height: 100)
                        .edgesIgnoringSafeArea(.bottom)
                    
                    Rectangle()
                        .fill(.gray)
                        .frame(height: 0.3)
                }
                .offset(y: 35)
            }
            
            HStack(spacing: 0) {
                TabBarItem(imageName: "tab1", tab: .Home, selectedTab: $selectedTab)
                TabBarItem(imageName: "tab2", tab: .Cooking, selectedTab: $selectedTab)
                TabBarItem(imageName: "tab3", tab: .Quiz, selectedTab: $selectedTab)
                TabBarItem(imageName: "tab4", tab: .Progress, selectedTab: $selectedTab)
            }
            .padding(.top, 10)
            .frame(height: 60)
        }
    }
}

struct TabBarItem: View {
    let imageName: String
    let tab: CustomTabBar.TabType
    @Binding var selectedTab: CustomTabBar.TabType
    
    var textColor: Color {
        if selectedTab == tab {
            switch tab {
            case .Home:
                return Color(red: 253/255, green: 71/255, blue: 25/255)
            case .Cooking:
                return Color(red: 253/255, green: 71/255, blue: 25/255)
            case .Quiz:
                return Color(red: 89/255, green: 189/255, blue: 154/255)
            case .Progress:
                return Color(red: 42/255, green: 140/255, blue: 241/255)
            }
        } else {
            return .black
        }
    }
    
    var body: some View {
        Button(action: {
            selectedTab = tab
        }) {
            VStack(spacing: 6) {
                Image(selectedTab == tab ? imageName + "Picked" : imageName)
                    .resizable()
                    .frame(width: 20, height: 20)
                
                Text("\(tab)")
                    .InterMedium(size: 12, color: textColor)
            }
            .frame(maxWidth: .infinity)
        }
    }
}

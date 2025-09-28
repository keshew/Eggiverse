import SwiftUI

struct FactModel: Identifiable {
    var id = UUID().uuidString
    var image: String
    var detailImages: [String]
    var title: String
    var desc: String
    var detailInfo: [String]
    var type: String
}

struct QuizQA {
    var question: String
    var answers: [String]
    var rightAnswerIndex: Int
}

struct QuizView: View {
    @StateObject var quizModel =  QuizViewModel()
    @State private var selected = 0
    @State var selectedFact = FactModel(image: "", detailImages: [""], title: "", desc: "", detailInfo: [""], type: "")
    @State var isDetailFact = false
    let segments = ["Daily Qiiz", "Facts", "Bird Map"]
    @State private var selectedAnswerIndex: Int? = nil
    @State private var questionIndex: Int = 0
    @State private var correctCount: Int = 0
    
    @State private var currentQuizSubset: [QuizQA] = []
    
    let totalQuestions = 3
    
    func startNewQuizRound() {
        currentQuizSubset = Array(quizModel.contact.quizData.shuffled().prefix(totalQuestions))
        questionIndex = 0
        selectedAnswerIndex = nil
        correctCount = 0
    }
    
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
                                    Text("\(UserDefaultsManager.shared.getGamesPlayed())")
                                        .InterBold(size: 22, color: Color(red: 248/255, green: 160/255, blue: 17/255))
                                    
                                    Text("Day Streak")
                                        .InterMedium(size: 14)
                                }
                                
                                Spacer()
                                
                                VStack {
                                    Text("\(UserDefaultsManager.shared.getXP())")
                                        .InterBold(size: 22, color: Color(red: 41/255, green: 204/255, blue: 31/255))
                                    
                                    Text("XP Points")
                                        .InterMedium(size: 14)
                                }
                                
                                Spacer()
                                
                                VStack {
                                    Text("\(UserDefaultsManager.shared.getGamesPlayed() * 2)")
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
                    .padding(.horizontal)
                    .padding(.top, 10)
                
                if selected == 0 {
                    VStack(spacing: 15) {
                        HStack {
                            Text("Question \(questionIndex + 1) of \(totalQuestions)")
                                .InterRegular(size: 16)
                            Spacer()
                            Image("cube")
                                .resizable()
                                .frame(width: 20, height: 20)
                            Text("\(correctCount) correct")
                                .InterBold(size: 16)
                        }
                        .padding(.horizontal)
                        
                        ZStack(alignment: .leading) {
                            Rectangle()
                                .fill(Color(red: 217/255, green: 217/255, blue: 217/255))
                                .frame(height: 12)
                                .cornerRadius(20)
                            
                            Rectangle()
                                .fill(Color.green)
                                .frame(width: CGFloat(correctCount) / CGFloat(max(3,1)) * 300, height: 12)
                                .cornerRadius(20)
                        }
                        .padding(.horizontal)
                    }
                    .padding(.top)
                }
                
                switch selected {
                case 0:
                    VStack {
                        if currentQuizSubset.isEmpty {
                            Text("Loading...")
                                .onAppear {
                                    startNewQuizRound()
                                }
                        } else {
                            ScrollView(showsIndicators: false) {
                                Rectangle()
                                    .fill(Color.white)
                                    .overlay {
                                        VStack {
                                            HStack {
                                                Text(currentQuizSubset[questionIndex].question)
                                                    .InterBold(size: 14)
                                                Spacer()
                                            }
                                            .padding(.trailing)
                                            
                                            Spacer()
                                            
                                            VStack(spacing: 15) {
                                                ForEach(0..<currentQuizSubset[questionIndex].answers.count, id: \.self) { index in
                                                    Rectangle()
                                                        .fill(Color.white)
                                                        .overlay {
                                                            Button(action: {
                                                                selectedAnswerIndex = index
                                                            }) {
                                                                RoundedRectangle(cornerRadius: 12)
                                                                    .stroke(selectedAnswerIndex == index ? Color.blue : Color.gray, lineWidth: 0.5)
                                                                    .overlay {
                                                                        HStack {
                                                                            Circle()
                                                                                .stroke(selectedAnswerIndex == index ? Color.blue : Color.gray, lineWidth: 0.5)
                                                                                .frame(width: 30, height: 30)
                                                                                .overlay {
                                                                                    Text(String(UnicodeScalar(65 + index)!))
                                                                                        .InterMedium(size: 14)
                                                                                }
                                                                            Text(currentQuizSubset[questionIndex].answers[index])
                                                                                .InterMedium(size: 14)
                                                                                .padding(.leading, 15)
                                                                                .multilineTextAlignment(.leading)
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
                                                .onTapGesture {
                                                    guard let selected = selectedAnswerIndex else { return }
                                                    if selected == currentQuizSubset[questionIndex].rightAnswerIndex {
                                                        correctCount += 1
                                                    }
                                                    selectedAnswerIndex = nil
                                                    
                                                    if questionIndex < totalQuestions - 1 {
                                                        questionIndex += 1
                                                    } else {
                                                        questionIndex = 0
                                                        correctCount = 0
                                                        startNewQuizRound()
                                                        UserDefaultsManager.shared.addXP(100)
                                                        UserDefaultsManager.shared.incrementGamesPlayed()
                                                    }
                                                }
                                        }
                                        .padding()
                                    }
                                    .frame(height: 380)
                                    .cornerRadius(16)
                                    .padding(.horizontal)
                                    .padding(.top, 10)
                                    .shadow(radius: 5)
                            }
                        }
                    }
                case 1:
                    ScrollView(showsIndicators: false) {
                        VStack {
                            ForEach(quizModel.contact.facts, id: \.id) { item in
                                ZStack(alignment: .bottom) {
                                    ZStack(alignment: .top) {
                                        Rectangle()
                                            .fill(.white)
                                            .frame(height: UIScreen.main.bounds.width > 600 ? 500 : 305)
                                            .cornerRadius(12)
                                            .shadow(radius: 5)
                                        
                                        VStack {
                                            ZStack(alignment: .top) {
                                                Image(item.image)
                                                    .resizable()
                                                    .frame(height: UIScreen.main.bounds.width > 600 ? 375 : 175)
                                                
                                                HStack {
                                                    Rectangle()
                                                        .fill(.white)
                                                        .frame(width: 85, height: 30)
                                                        .overlay {
                                                            Text(item.type)
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
                                                        Text(item.title)
                                                            .InterBold(size: 16)
                                                        
                                                        Text(item.desc)
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
                                            selectedFact = item
                                            UserDefaultsManager.shared.incrementFactsRead(by: 1)
                                            UserDefaultsManager.shared.addXP(10)
                                            isDetailFact = true
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
                                            ShareLink(item: item.desc) {
                                                Image(.share)
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
                            
                            Color.clear.frame(height: 70)
                        }
                    }
                case 2:
                    ScrollView(showsIndicators: false) {
                        VStack {
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
                            
                            Color.clear.frame(height: 70)
                        }
                    }
                default:
                    VStack {
                        if currentQuizSubset.isEmpty {
                            Text("Loading...")
                                .onAppear {
                                    startNewQuizRound()
                                }
                        } else {
                            ScrollView(showsIndicators: false) {
                                Rectangle()
                                    .fill(Color.white)
                                    .overlay {
                                        VStack {
                                            HStack {
                                                Text(currentQuizSubset[questionIndex].question)
                                                    .InterBold(size: 14)
                                                Spacer()
                                            }
                                            .padding(.trailing)
                                            
                                            Spacer()
                                            
                                            VStack(spacing: 15) {
                                                ForEach(0..<currentQuizSubset[questionIndex].answers.count, id: \.self) { index in
                                                    Rectangle()
                                                        .fill(Color.white)
                                                        .overlay {
                                                            Button(action: {
                                                                selectedAnswerIndex = index
                                                            }) {
                                                                RoundedRectangle(cornerRadius: 12)
                                                                    .stroke(selectedAnswerIndex == index ? Color.blue : Color.gray, lineWidth: 0.5)
                                                                    .overlay {
                                                                        HStack {
                                                                            Circle()
                                                                                .stroke(selectedAnswerIndex == index ? Color.blue : Color.gray, lineWidth: 0.5)
                                                                                .frame(width: 30, height: 30)
                                                                                .overlay {
                                                                                    Text(String(UnicodeScalar(65 + index)!))
                                                                                        .InterMedium(size: 14)
                                                                                }
                                                                            Text(currentQuizSubset[questionIndex].answers[index])
                                                                                .InterMedium(size: 14)
                                                                                .padding(.leading, 15)
                                                                                .multilineTextAlignment(.leading)
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
                                                .onTapGesture {
                                                    guard let selected = selectedAnswerIndex else { return }
                                                    if selected == currentQuizSubset[questionIndex].rightAnswerIndex {
                                                        correctCount += 1
                                                    }
                                                    selectedAnswerIndex = nil
                                                    
                                                    if questionIndex < totalQuestions - 1 {
                                                        questionIndex += 1
                                                    } else {
                                                        questionIndex = 0
                                                        correctCount = 0
                                                        startNewQuizRound()
                                                        UserDefaultsManager.shared.addXP(100)
                                                        UserDefaultsManager.shared.incrementGamesPlayed()
                                                    }
                                                }
                                        }
                                        .padding()
                                    }
                                    .frame(height: 380)
                                    .cornerRadius(16)
                                    .padding(.horizontal)
                                    .padding(.top, 10)
                                    .shadow(radius: 5)
                            }
                        }
                    }
                }
            }
        }
        .fullScreenCover(isPresented: $isDetailFact) {
            DetailFactView(fact: $selectedFact)
        }
    }
}

#Preview {
    QuizView()
}


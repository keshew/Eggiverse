import SwiftUI

class HomeViewModel: ObservableObject {
    let contact = HomeModel()
    
    @Published var threeIndices: [Int] = []
    @Published var currentIndex: Int = 0
    
    private let savedIndicesKey = "savedEggFactIndices"
    private let savedDateKey = "savedEggFactDate"
    
    init() {
        loadOrPickFacts()
    }
    
    func loadOrPickFacts() {
        let defaults = UserDefaults.standard
        
        if let savedData = defaults.data(forKey: savedIndicesKey),
           let savedDate = defaults.object(forKey: savedDateKey) as? Date {
            
            if Date().timeIntervalSince(savedDate) < 24 * 60 * 60 {
                if let savedIndices = try? JSONDecoder().decode([Int].self, from: savedData) {
                    threeIndices = savedIndices
                    currentIndex = 0
                    return
                }
            }
        }
        
        pickThreeUnique()
        saveThreeUnique()
    }
    
    func pickThreeUnique() {
        var indicesSet = Set<Int>()
        while indicesSet.count < 3 && indicesSet.count < contact.eggFacts.count {
            indicesSet.insert(Int.random(in: 0..<contact.eggFacts.count))
        }
        threeIndices = Array(indicesSet)
        currentIndex = 0
    }
    
    func saveThreeUnique() {
        if let encoded = try? JSONEncoder().encode(threeIndices) {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: savedIndicesKey)
            defaults.set(Date(), forKey: savedDateKey)
        }
    }
    
    func nextFact() {
        if currentIndex < threeIndices.count - 1 {
            currentIndex += 1
        }
    }
    func prevFact() {
        if currentIndex > 0 {
            currentIndex -= 1
        }
    }
}

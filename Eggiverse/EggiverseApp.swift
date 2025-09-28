import SwiftUI

@main
struct EggiverseApp: App {
    @State private var isFirstLaunch: Bool = true

    init() {
        let launchedBefore = UserDefaults.standard.bool(forKey: "hasLaunchedBefore")
        if launchedBefore {
            _isFirstLaunch = State(initialValue: false)
        } else {
            UserDefaults.standard.set(true, forKey: "hasLaunchedBefore")
            UserDefaults.standard.synchronize()
            _isFirstLaunch = State(initialValue: true)
        }
    }

    var body: some Scene {
        WindowGroup {
            if isFirstLaunch {
                SplashView()
            } else {
                TabBarView()
            }
        }
    }
}

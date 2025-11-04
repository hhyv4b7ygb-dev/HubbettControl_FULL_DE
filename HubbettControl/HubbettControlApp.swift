import SwiftUI
import CoreBluetooth

@main
struct HubbettControlApp: App {
    @StateObject private var bleManager = BLEManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(bleManager)
                .preferredColorScheme(.dark)
        }
    }
}

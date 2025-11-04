import SwiftUI

struct ContentView: View {
    @EnvironmentObject var ble: BLEManager
    
    var body: some View {
        VStack(spacing: 15) {
            Text("Hubbett Control")
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding(.top, 40)
            
            Grid(horizontalSpacing: 20, verticalSpacing: 20) {
                GridRow {
                    controlButton("A↑", cmd: "A+")
                    controlButton("A↓", cmd: "A-")
                }
                GridRow {
                    controlButton("B↑", cmd: "B+")
                    controlButton("B↓", cmd: "B-")
                }
                GridRow {
                    controlButton("C↑", cmd: "C+")
                    controlButton("C↓", cmd: "C-")
                }
                GridRow {
                    controlButton("D↑", cmd: "D+")
                    controlButton("D↓", cmd: "D-")
                }
            }
            .padding(.top, 30)
            
            HStack(spacing: 30) {
                controlButton("ALL↑", cmd: "ALL+")
                controlButton("ALL↓", cmd: "ALL-")
            }
            .padding(.top, 40)
            
            controlButton("Auto-Waage", cmd: "AUTO")
                .padding(.top, 30)
            
            controlButton("STOP", cmd: "STOP")
                .padding(.top, 30)
                .foregroundColor(.red)
            
            Spacer()
        }
        .padding()
        .background(Color.black.ignoresSafeArea())
    }
    
    func controlButton(_ label: String, cmd: String) -> some View {
        Button(action: { ble.sendCommand(cmd) }) {
            Text(label)
                .font(.system(size: 22, weight: .bold))
                .frame(width: 120, height: 60)
                .background(Color.gray.opacity(0.3))
                .foregroundColor(.white)
                .clipShape(Capsule())
        }
    }
}

import Foundation
import CoreBluetooth

class BLEManager: NSObject, ObservableObject, CBCentralManagerDelegate, CBPeripheralDelegate {
    @Published var isConnected = false
    private var centralManager: CBCentralManager!
    private var hubbettPeripheral: CBPeripheral?
    
    let targetName = "HUBBETT-iOS"
    
    override init() {
        super.init()
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
            centralManager.scanForPeripherals(withServices: nil, options: nil)
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        if peripheral.name == targetName {
            hubbettPeripheral = peripheral
            hubbettPeripheral?.delegate = self
            centralManager.stopScan()
            centralManager.connect(peripheral, options: nil)
        }
    }
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        isConnected = true
        print("Verbunden mit \(peripheral.name ?? "unbekannt")")
    }
    
    func sendCommand(_ command: String) {
        print("Befehl an ESP32: \(command)")
        // hier später BLE-Sende-Funktion ergänzen
    }
}

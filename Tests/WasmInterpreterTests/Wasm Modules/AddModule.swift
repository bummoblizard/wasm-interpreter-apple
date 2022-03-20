import Foundation
import WasmInterpreter

public struct AddModule {
    private let _vm: WasmInterpreter

    init() throws {
        _vm = try WasmInterpreter(module: AddModule.wasm)
        
    }

    func add(_ first: Int, _ second: Int) throws -> Int {
        return Int(try _vm.call("add", Int32(first), Int32(second)) as Int32)
    }

    // `wat2wasm -o >(base64) Tests/WasmInterpreterTests/Resources/add.wat | pbcopy`
    private static var wasm: [UInt8] {
        let base64 = "AGFzbQEAAAABCgJgAABgAn9/AX8DAwIAAQUDAQACBisHfwFBgIgEC38AQYAIC38AQYAIC38AQYAIC38AQYCIBAt/AEEAC38AQQELB30JBm1lbW9yeQIAEV9fd2FzbV9jYWxsX2N0b3JzAAADYWRkAAEMX19kc29faGFuZGxlAwEKX19kYXRhX2VuZAMCDV9fZ2xvYmFsX2Jhc2UDAwtfX2hlYXBfYmFzZQMEDV9fbWVtb3J5X2Jhc2UDBQxfX3RhYmxlX2Jhc2UDBgpCAgIACz0BBn8jgICAgAAhAkEQIQMgAiADayEEIAQgADYCDCAEIAE2AgggBCgCDCEFIAQoAgghBiAFIAZqIQcgBw8LADQEbmFtZQEZAgARX193YXNtX2NhbGxfY3RvcnMBA2FkZAcSAQAPX19zdGFja19wb2ludGVyAC8JcHJvZHVjZXJzAQxwcm9jZXNzZWQtYnkBDkhvbWVicmV3IGNsYW5nBjEzLjAuMQ=="
        return Array<UInt8>(Data(base64Encoded: base64)!)
    }
}

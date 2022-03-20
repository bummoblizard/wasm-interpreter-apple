import Foundation
import WasmInterpreter

public struct CustomModule {
    private let _vm: WasmInterpreter

    init(base64: String) throws {
        let wasm = Array<UInt8>(Data(base64Encoded: base64)!)
        _vm = try WasmInterpreter(module: wasm)
    }

    func main(args: [String]) throws -> Int {
        return Int(try _vm.call("main", args) as Int32)
    }
}

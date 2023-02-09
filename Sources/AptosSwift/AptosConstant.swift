import Foundation

class AptosConstant {
    
    static let DEV_RPC_URL = "https://fullnode.devnet.aptoslabs.com"
    static let MAIN_RPC_URL = "https://rpc.mainnet.aptos.fernlabs.xyz"
    
}

public enum ChainType: Int {
    case mainnet
    case devnet
}

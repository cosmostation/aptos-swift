import Foundation
import Alamofire
import web3swift
import SwiftyJSON

open class AptosClient {
    
    var rpc_endpoint: String!
    
    public static let shared = AptosClient()
    
    public init() { }
    
    public func setConfig(_ chainType: ChainType) {
        switch chainType {
        case .mainnet:
            rpc_endpoint = AptosConstant.MAIN_RPC_URL
        case .devnet:
            rpc_endpoint = AptosConstant.DEV_RPC_URL
        }
    }
    
    public func generateMnemonic() -> String? {
        return try? BIP39.generateMnemonics(bitsOfEntropy: 128)
    }
    
    public func getAddress(_ mnemonic: String)  -> String {
        return AptosKey.getAptosAddress(mnemonic)
    }
    
    public func sign(_ mnemonic: String, _ txBytes: Data) -> (pubKey: Data, signedData: Data) {
        let seedKey = AptosKey.getSeedKey(mnemonic)
        return (AptosKey.getPubKey(mnemonic), AptosKey.sign(seedKey, txBytes))
    }
    
    public func getAccount(address: String) -> DataRequest {
        return AF.request("\(rpc_endpoint!)/v1/accounts/\(address)",
                   method: .get)
    }
    
    public func getAccountResources(address: String) -> DataRequest {
        return AF.request("\(rpc_endpoint!)/v1/accounts/\(address)/resources",
                   method: .get)
    }
    
    public func getAccountTransactions(address: String) -> DataRequest {
        return AF.request("\(rpc_endpoint!)/v1/accounts/\(address)/transactions",
                   method: .get)
    }
    
//    public func encodeSubmission(encodeRequest: EncodeRequest) -> DataRequest {
//        return AF.request("\(rpc_endpoint)/v1/transactions/encode_submission",
//                   method: .post,
//                  parameters: encodeRequest,
//                  encoding: JSONParameterEncoder.default
//        )
//    }
//
//    public func submitTransaction(submitRequest: SubmitRequest) -> DataRequest {
//        return AF.request("\(rpc_endpoint)/v1/transactions",
//                   method: .post,
//                  parameters: submitRequest,
//                  encoding: JSONParameterEncoder.default
//        )
//    }
}

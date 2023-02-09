import Foundation
import SwiftyJSON

public struct EncodeRequest: Codable {
    let sender: String
    let sequence_number: String
    let max_gas_amount: String
    let gas_unit_price: String
    let expiration_timestamp_secs: String
    let payload: Payload
    
    init(sender: String, sequence_number: String, max_gas_amount: String = "101600", gas_unit_price: String = "100", payload: Payload) {
        self.sender = sender
        self.sequence_number = sequence_number
        self.max_gas_amount = max_gas_amount
        self.gas_unit_price = gas_unit_price
        self.expiration_timestamp_secs = String((Date().timeIntervalSince1970 * 1000).rounded())
        self.payload = payload
    }
}

public struct SubmitRequest: Codable {
    let sender: String
    let sequence_number: String
    let max_gas_amount: String
    let gas_unit_price: String
    let expiration_timestamp_secs: String
    let payload: Payload
    
    init(sender: String, sequence_number: String, max_gas_amount: String = "101600", gas_unit_price: String = "100", payload: Payload) {
        self.sender = sender
        self.sequence_number = sequence_number
        self.max_gas_amount = max_gas_amount
        self.gas_unit_price = gas_unit_price
        self.expiration_timestamp_secs = String((Date().timeIntervalSince1970 * 1000).rounded())
        self.payload = payload
    }
}

public struct Payload: Codable {
    let type: String
    let function: String
    let type_arguments: [String]
    let arguments: [String]
    
    init(type: String, function: String, type_arguments: [String], arguments: [String]) {
        self.type = type
        self.function = function
        self.type_arguments = type_arguments
        self.arguments = arguments
    }
}

public struct Signature: Codable {
    let type: String
    let public_key: String
    let signature: String
    
    init(type: String, public_key: String, signature: String) {
        self.type = type
        self.public_key = public_key
        self.signature = signature
    }
}

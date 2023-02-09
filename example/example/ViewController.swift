import UIKit
import AptosSwift
import SwiftyJSON

enum MENU {
    case NewMnemonic
    case LoadMnemonic
    case GetAccount
    case GetAccountTransactions
    case Transfer
    
    static let allValues = [NewMnemonic, LoadMnemonic, GetAccount, GetAccountTransactions, Transfer]
}

class ViewController: UIViewController {
    @IBOutlet weak var IbMnemonic: UILabel!
    @IBOutlet weak var IbAddress: UILabel!

    let preloadMnemonic = "sketch olympic symptom divorce regret biology strong ancient corn liar repair dust"
    var address: String?
    var mnemonic: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AptosClient.shared.setConfig(ChainType.devnet)
    }
    
    @IBAction func onCreateNewMnemonic(_ sender: UIButton) {
        mnemonic = AptosClient.shared.generateMnemonic()
        IbMnemonic.text = mnemonic
        if let mnemonic = mnemonic {
            address = AptosClient.shared.getAddress(mnemonic)
            IbAddress.text = address
            print(address)
        }
    }
    
    @IBAction func onLoadMnemonic(_ sender: UIButton) {
        mnemonic = preloadMnemonic
        IbMnemonic.text = mnemonic
        if let mnemonic = mnemonic {
            address = AptosClient.shared.getAddress(mnemonic)
            IbAddress.text = address
            print(address)
        }
    }
    
    @IBAction func getAccount(_ sender: UIButton) {
        if let address = address {
            AptosClient.shared.getAccount(address: address).responseJSON { (response) in
                switch response.result {
                case .success(let result):
                    print(result)
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    @IBAction func getAccountResources(_ sender: UIButton) {
        if let address = address {
            AptosClient.shared.getAccountResources(address: address).responseJSON { (response) in
                switch response.result {
                case .success(let result):
                    print(result)
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    @IBAction func getAccountTx(_ sender: UIButton) {
        if let address = address {
            AptosClient.shared.getAccountTransactions(address: address).responseJSON { (response) in
                switch response.result {
                case .success(let result):
                    print(result)
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    @IBAction func transfer(_ sender: UIButton) {
        print("TBD")
    }
}

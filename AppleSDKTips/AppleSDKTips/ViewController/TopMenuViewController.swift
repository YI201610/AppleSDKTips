//
//  TopMenuViewController.swift
//  AppleSDKTips
//

import UIKit

class TopMenuViewController: UIViewController {

    //---------------------------------------------
    // MARK: - Properties
    
    @IBOutlet weak var tableView: UITableView!
    
    /** plistマスターデータのデータを供給するモデルコントローラー */
    var modelController: TopMenuModelController?

    /** テーブル・ビューのデータソース */
    var dataSource: TopMenuTableViewDataSource?
    
    
    //---------------------------------------------
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        modelController = TopMenuModelController(plistName: plistPathString())
        
        guard let modelControllerRef = modelController else {
            assert(false, "TopMenuModelControllerが作成できません")
            return
        }
        
        dataSource = TopMenuTableViewDataSource(controller: modelControllerRef)
    }
    

    //---------------------------------------------
    // MARK: - Private
    
    private func plistPathString() -> String {
        
        let testBundle = Bundle(for: type(of: self))
        let path = testBundle.path(forResource: "topMenu", ofType: "plist")
        
        guard let plistPath = path else {
            return String()
        }
        
        return plistPath
    }
    
}
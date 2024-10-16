//
//  DetailViewController.swift
//  MoneyTrip
//
//  Created by 권정근 on 10/16/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MARK: - Variables
    var selectedSpotItem: AttractionItem?
    
    // MARK: - UI Components
    

    // MARK: - // MARK: - Initializations
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemRed
        print("선택한 곳의 이름은: \(selectedSpotItem?.title) ")
    }
}

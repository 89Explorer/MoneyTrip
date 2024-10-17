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
    let detailMainView: DetailMainView = {
        let view = DetailMainView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    // MARK: - Initializations
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        // 화면을 아래로 스크롤하면 네비게이션바 부분이 숨겨지고, 반대로 하면 나타나는 기능
        navigationController?.hidesBarsOnSwipe = false
        configureNavigationBarAppearance()
        configureConstraints()
        
        configureDetail()
    }
    
    // MARK: - Layout
    private func configureConstraints() {
        view.addSubview(detailMainView)
        
        let detailMainViewConstraints = [
            detailMainView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailMainView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            detailMainView.topAnchor.constraint(equalTo: view.topAnchor),
            detailMainView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(detailMainViewConstraints)
    }
    
    // MARK: - Configure Navigation Bar Appearance
    private func configureNavigationBarAppearance() {
        // 스크롤 전 외관 설정 (투명한 배경)
        let transparentAppearance = UINavigationBarAppearance()
        transparentAppearance.configureWithTransparentBackground() // 투명한 배경
        transparentAppearance.titleTextAttributes = [.foregroundColor: UIColor.black] // 텍스트 색상
        
        // 스크롤 시 외관 설정 (불투명한 배경)
        let opaqueAppearance = UINavigationBarAppearance()
        opaqueAppearance.configureWithOpaqueBackground() // 불투명한 배경
        opaqueAppearance.backgroundColor = .systemBackground // 배경색 흰색으로 설정
        opaqueAppearance.titleTextAttributes = [.foregroundColor: UIColor.black] // 텍스트 색상
        
        /// 스크롤 전 네비게이션 바 설정  불투명
        navigationController?.navigationBar.standardAppearance = opaqueAppearance
        // 스크롤 시 네비게이션 바 설정 (시스템백그라운드색)
        navigationController?.navigationBar.scrollEdgeAppearance = transparentAppearance
    }
    
    func configureDetail() {
        guard let item = selectedSpotItem else { return }
        self.detailMainView.detailHeaderView.getDetailSpot(with: item)
    }
}

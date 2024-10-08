//
//  SearchResultslViewController.swift
//  MoneyTrip
//
//  Created by 권정근 on 10/9/24.
//

import UIKit

class SearchResultslViewController: UIViewController {
    
    // MARK: - Variables
    var categories: [String] = ["관광지", "문화시설", "음식점", "코스 여행", "쇼핑"]
    
    // MARK: - UI Components
    let resultsTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.isScrollEnabled = true
        tableView.tintColor = .label
        tableView.separatorStyle = .none
        return tableView
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        view.addSubview(resultsTableView)
        
        configureConstraints()
        
        configureTableView()
    }
    
    // MARK: - Layouts
    private func configureConstraints() {
        let resultsTableViewConstraints = [
            resultsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            resultsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            resultsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            resultsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(resultsTableViewConstraints)
    }
    
    // MARK: - Functions
    func configureTableView() {
        resultsTableView.delegate = self
        resultsTableView.dataSource = self
        resultsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    @objc func loadMoreResults(_ sender: UIButton) {
        let section = sender.tag
        
        switch section {
        case 0:
            print("\(categories[sender.tag]) 더보기 호출")
            // 관광지 더보기 로직 추가
        case 1:
            print("\(categories[sender.tag]) 더보기 호출")
            // 가이드 더보기 로직 추가
        case 2:
            print("\(categories[sender.tag]) 더보기 호출")
            // 여행기 더보기 로직 추가
        case 3:
            print("\(categories[sender.tag]) 더보기 호출")
            // 숙소 더보기 로직 추가
        default:
            print("\(categories[sender.tag]) 더보기 호출")
        }
    }
}

extension SearchResultslViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.backgroundColor = .red
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView,viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView()
    
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "\(categories[section])"
        label.font = UIFont(name: "HakgyoansimBunpilR", size: 16)
        label.textColor = .label
        label.backgroundColor = .clear
        label.textAlignment = .left
        
        headerView.addSubview(label)
        
        NSLayoutConstraint.activate([
            
            label.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 10),
            label.topAnchor.constraint(equalTo: headerView.topAnchor)
        ])
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        footerView.backgroundColor = .clear
        
        let button = UIButton(type: .system)
        
        // 섹션에 따라 버튼 타이틀을 설정
        switch section {
        case 0:
            button.setTitle("관광지 검색결과 더보기", for: .normal)
        case 1:
            button.setTitle("가이드 검색결과 더보기", for: .normal)
        case 2:
            button.setTitle("여행기 검색결과 더보기", for: .normal)
        case 3:
            button.setTitle("숙소 검색결과 더보기", for: .normal)
        default:
            button.setTitle("더보기", for: .normal) // 기본값
        }
        
        button.setTitleColor(.systemBlue, for: .normal)
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.systemBlue.cgColor
        
        button.addTarget(self, action: #selector(loadMoreResults(_:)), for: .touchUpInside)
        button.tag = section // 섹션 번호를 태그로 설정하여 어떤 섹션에서 호출되었는지 구분
        
        button.translatesAutoresizingMaskIntoConstraints = false
        footerView.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: footerView.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: footerView.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 180),
            button.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        return footerView
    }
}

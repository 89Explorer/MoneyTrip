//
//  NetworkManager.swift
//  MoneyTrip
//
//  Created by 권정근 on 10/16/24.
//

import Foundation

// MARK: - Constants
struct Constants {
    static let api_key = "jlK%2B0ig7iLAbdOuTJsnkp6n0RdeEMtGKsw53jEMbKm3PcB7NFTSeUrnXixogiuvNtHQXeqxgV88buRZvTjG73w%3D%3D"
    static let base_URL = "https://apis.data.go.kr/B551011/KorService1"
}


// MARK: - NetworkManager

class NetworkManager {
    
    static let shared = NetworkManager()
    
    var totalPages: Int?

    // 앱 초기화 시 totalPages 계산
    func initailizeTotalPages(completion: @escaping(Result<Void, Error>) -> Void) {
        getAreaBasedList { result in
            switch result {
            case .success(let item):
                let totalCounts = item.response.body.totalCount
                self.totalPages = (totalCounts / 10) + 1
                completion(.success(()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
    // 전체 관광정보 조회 관련 함수 (관광지, 문화시설, 여행코스, 숙박, 쇼핑 포함)
    func getAreaBasedList(pageNo: String = "1", contentTypeId: String = "12" ,completion: @escaping (Result<AttractionResponse, Error>) -> Void) {
        var components = URLComponents(string: "\(Constants.base_URL)/areaBasedList1")
        
        // 쿼리 아이템 설정
        components?.queryItems = [
            URLQueryItem(name: "serviceKey", value: Constants.api_key),
            URLQueryItem(name: "numOfRows", value: "10"),
            URLQueryItem(name: "pageNo", value: pageNo),
            URLQueryItem(name: "MobileOS", value: "ETC"),
            URLQueryItem(name: "MobileApp", value: "AppTest"),
            URLQueryItem(name: "_type", value: "json"),
            URLQueryItem(name: "listYN", value: "Y"),
            URLQueryItem(name: "arrange", value: "O"),
            URLQueryItem(name: "contentTypeId", value: contentTypeId)
        ]
        
        // 퍼센트 인코딩 후 "+"를 "%2B"로 대체
        if let encodedQuery = components?.percentEncodedQuery?.replacingOccurrences(of: "%25", with: "%") {
            components?.percentEncodedQuery = encodedQuery
        }
        
        // URL 생성
        guard let url = components?.url else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else { return  print("error1")}
            
            do {
                let results = try JSONDecoder().decode(AttractionResponse.self, from: data)
                completion(.success(results))
            } catch {
                completion(.failure(error))
                print("error2")
            }
        }
        task.resume()
    }
    
    
    // 무작위로 받아오는 함수
    func fetchRandomAttractions(completion: @escaping (Result<AttractionResponse, Error>) -> Void) {
        guard let totalPages = totalPages else {
            return
        }
        
        let randomPage = "\(Int.random(in: 1...totalPages))"
        
        // 랜덤 페이지를 기반으로 실제 데이터를 요청
        getAreaBasedList(pageNo: randomPage) { results in
            switch results {
            case .success(let item):
                completion(.success(item))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

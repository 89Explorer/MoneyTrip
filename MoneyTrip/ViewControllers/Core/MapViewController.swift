//
//  MapViewController.swift
//  MoneyTrip
//
//  Created by 권정근 on 10/7/24.
//
//



import UIKit
import MapKit

class MapViewController: UIViewController {
    
    // MARK: - Variables
    let locationManager = CLLocationManager()
    var newHeightConstraint: NSLayoutConstraint!
    
    
    // MARK: - UI Components
    let mapView: MapView = {
        let view = MapView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let mapSearchView: MapSearchView = {
        let view = MapSearchView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Initializations
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        configureConstraints()
        
        gestureMapSearchView()
        
        mapView.locationMapView.showsUserLocation = true   // 사용자 위치 표시
        mapView.locationMapView.delegate = self
        
        mapSearchView.searchBar.delegate = self   // Search Bar delegate
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization() // 권한 요청
        locationManager.startUpdatingLocation()
        
        // MapSearchView의 topAnchor를 기준으로 userLocationButton 위치 설정
        mapView.positionUserLocationButton(relativeTo: mapSearchView.topAnchor)
        
        configureUserLocationButton()
    }
    
    
    /// MapViewController 내 오토레이아웃 설정 함수
    private func configureConstraints() {
        
        view.addSubview(mapView)
        let mapViewConstraints = [
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        NSLayoutConstraint.activate(mapViewConstraints)
        
        
        view.addSubview(mapSearchView)
        
        let mapSearchViewHeightConstraint = mapSearchView.mapSearchViewHeightConstraint
        
        let mapSearchViewConstraints = [
            mapSearchView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapSearchView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapSearchView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mapSearchViewHeightConstraint!
        ]
        
        NSLayoutConstraint.activate(mapSearchViewConstraints)
    }
    
    func gestureMapSearchView() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
        mapSearchView.addGestureRecognizer(panGesture)
    }
    
    func configureUserLocationButton() {
        mapView.userLocationButton.addTarget(self, action: #selector(userLocationButtonTapped), for: .touchUpInside)
    }
    
    @objc func userLocationButtonTapped() {
        print("userLocationButton() - called")
    }
    
    
    // MARK: - Pan Gesture Handler for SearchView height adjustment
    @objc func handlePanGesture(_ gesture: UIPanGestureRecognizer) {
        
        let translation = gesture.translation(in: view)   // 제스처가 시작된 이후 이동된 위치를 나타냄
        let newHeight = mapSearchView.mapSearchViewHeightConstraint.constant - translation.y  // mapSearchView의 높이를 실시간으로 조절, .constant는 해당 제약 조건의 실제 값을 의미

        // mapSearchView 높이를 조정하는 코드
        if newHeight >= 150 && newHeight <= 650 { // 최소 높이 150, 최대 높이 650 이렇게 조건을 걸어서 mapSearchView가 너무 작아지거나 너무 커지지 않도록 최소 높이와 최대 높이를 설정
            mapSearchView.mapSearchViewHeightConstraint.constant = newHeight  // 팬 제스처로 계산된 newHeight 값을 searchViewHeightConstraint.constant에 할당해서, 실시간으로 searchView의 높이를 조정
            gesture.setTranslation(.zero, in: view) // 다음 변환을 위한 초기화, gesture.translation(in:)은 팬이 시작된 지점부터 계속 이동값을 누적되기 때문
        }
        
        if gesture.state == .ended {
            var targetHeight: CGFloat
            
            // 높이 자동 조정 (미디엄, 라지 등 높이로 자동 스냅)
            if newHeight > 400 {
                targetHeight = 650 // large 높이
            } else if newHeight > 200 {
                targetHeight = 350 // medium 높이
            } else {
                targetHeight = 200 // small 높이
            }
            
            // 스프링 애니메이션을 통해 바운스 효과 적용
            UIView.animate(
                withDuration: 0.5,
                delay: 0,
                usingSpringWithDamping: 0.6, // 바운스 효과 설정 (0에 가까울수록 바운스가 더 큼)
                initialSpringVelocity: 0.8, // 초기 속도 설정
                options: .curveEaseInOut,
                animations: {
                    self.mapSearchView.mapSearchViewHeightConstraint.constant = targetHeight
                    self.view.layoutIfNeeded() // 애니메이션으로 높이 변경
                },
                completion: nil
            )
        }
    }
}

// MARK: - CLLocationManagerDelegate and MKMapViewDelegate
extension MapViewController: CLLocationManagerDelegate, MKMapViewDelegate {
    
    // 새로운 위치로 업데이트 되었을 때 실행하는 메서드
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let userLocation = locations.first {
            zoomToUserLocation(userLocation)
            locationManager.stopUpdatingLocation() // 사용자 위치 업데이트 중지
        }
    }
    
    func zoomToUserLocation(_ location: CLLocation) {
        let regionRadius: CLLocationDistance = 1000
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.locationMapView.setRegion(coordinateRegion, animated: true)
    }
}

// MARK: - UISearchBarDelegate
extension MapViewController: UISearchBarDelegate {

    
    // UISearchBarDelegate Methods
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else { return }
        performSearch(query: searchText)
        
        // 서치바에 검색을 마무리하고 나면 뷰가 올라오게 한다.
        UIView.animate(withDuration: 0.3) {
            self.mapSearchView.mapSearchViewHeightConstraint.constant = 650
            self.view.layoutIfNeeded()
        }
        
        // 키보드 창에 "검색"이라는 버튼을 누르면 키보드가 내려간다.
        searchBar.resignFirstResponder()
    }
    
    // 검색 로직 구현
    private func performSearch(query: String) {
        print("Searching for: \(query)")
        // 실제 검색을 수행하는 로직 추가 (예: 장소 검색)
    }
    
    
    // 빈 화면을 누르면 키보드가 내려가게 설정
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    // 서치바를 눌렀을 때 키보드가 올라오면서 그에 해당하는 view의 높이도 조절
    // 다만, 키보드가 내려갔을 때,높이는 원상복귀되지 않음
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        UIView.animate(withDuration: 0.3) {
            self.mapSearchView.mapSearchViewHeightConstraint.constant = 400
            self.view.layoutIfNeeded()
        }
    }
}

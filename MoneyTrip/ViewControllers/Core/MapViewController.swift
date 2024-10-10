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
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        configureConstraints()
        
        gestureMapSearchView()
        
        mapView.locationMapView.showsUserLocation = true   // 사용자 위치 표시
        mapView.locationMapView.delegate = self
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization() // 권한 요청
        locationManager.startUpdatingLocation()
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
    
    
    // MARK: - Pan Gesture Handler for SearchView height adjustment
    @objc func handlePanGesture(_ gesture: UIPanGestureRecognizer) {
        
        let translation = gesture.translation(in: view)
        /*
         gesture.translation(in: view)는 팬 제스처가 발생한 동안 사용자가 손가락을 얼마나 이동했는지를 반환하는 메서드야.
         translation은 제스처가 시작된 이후로 손가락이 움직인 좌표 차이(x, y)를 나타내는 CGPoint 객체를 반환해. 이 좌표는 특정 뷰(in: view)를 기준으로 계산돼.
         
         이 값은 제스처가 시작한 지점과 현재 지점 사이의 차이를 나타내며, 위 코드에서는 translation.y가 사용돼서 세로 방향으로 얼마만큼 움직였는지를 계산하는 데 사용되고 있어.
         그 값(translation.y)을 사용해 searchViewHeightConstraint.constant에 더하거나 빼서 searchView의 높이를 실시간으로 조절하는 방식이야. 즉, 팬 제스처로 사용자가 손가락을 얼마나 위아래로 움직였는지에 따라 searchView의 높이가 달라지게 돼.
         */
        
        let newHeight = mapSearchView.mapSearchViewHeightConstraint.constant - translation.y
        /*
         .constant는 해당 제약 조건의 실제 값을 의미
         */
        
        
        // mapSearchView 높이를 조정하는 코드
        if newHeight >= 150 && newHeight <= 650 { // 최소 높이 150, 최대 높이 650 이렇게 조건을 걸어서 mapSearchView가 너무 작아지거나 너무 커지지 않도록 최소 높이와 최대 높이를 설정
            mapSearchView.mapSearchViewHeightConstraint.constant = newHeight
            /*
             이 코드는 팬 제스처로 계산된 newHeight 값을 searchViewHeightConstraint.constant에 할당해서, 실시간으로 searchView의 높이를 조정하는 거야. 사용자가 손가락을 팬 하면 그에 맞춰 뷰의 높이가 즉시 변하는 것.
             */
            gesture.setTranslation(.zero, in: view) // 다음 변환을 위한 초기화
            /*
             의미: 이 코드는 팬 제스처가 끝나지 않았더라도 현재 제스처의 이동값을 초기화하는 역할을 해.
             팬 제스처가 한 번 시작되면 gesture.translation(in:)은 팬이 시작된 지점부터 계속 이동값을 누적해서 계산해. 그래서 제스처가 발생할 때마다 그 누적된 값을 초기화해 주기 위해 gesture.setTranslation(.zero, in: view)를 호출해 이동 거리를 0으로 리셋하는 거야.
             이렇게 함으로써 다음 팬 동작에서 새로운 움직임이 이전 팬 동작에 영향을 미치지 않도록 해주는 거지.
             */
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

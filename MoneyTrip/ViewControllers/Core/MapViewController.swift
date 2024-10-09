//
//  MapViewController.swift
//  MoneyTrip
//
//  Created by 권정근 on 10/7/24.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    // MARK: - Variables
    let locationManager = CLLocationManager()
    let geocoder = CLGeocoder()

    private var mapView: MKMapView!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemRed
        
        // MKMapView 초기화 및 뷰에 추가
        mapView = MKMapView(frame: self.view.bounds)
        self.view.addSubview(mapView)
        
        
        // 지도의 중심 좌표와 줌 레벨 설정
        let center = CLLocationCoordinate2D(latitude: 37.52474821, longitude: 126.675375547) // San Francisco, CA
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = center
        annotation.title = "가정역입니다."
        mapView.addAnnotation(annotation)
        mapView.setRegion(region, animated: true)
    }
}

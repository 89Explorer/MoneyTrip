//
//  MapView.swift
//  MoneyTrip
//
//  Created by 권정근 on 10/10/24.
//

import UIKit
import MapKit

class MapView: UIView {
    
    // MARK: - UI Components
    let locationMapView: MKMapView = {
        let mapView = MKMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        return mapView
    }()
    
    let userLocationButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        let configure = UIImage.SymbolConfiguration(pointSize: 20)
        let image = UIImage(systemName: "location.circle", withConfiguration: configure)
        button.setImage(image, for: .normal)
        button.tintColor = .label
        return button
    }()
    
    let showMapSearchButton: UIButton = {
        let button = UIButton(type: .system)
        let configure = UIImage.SymbolConfiguration(pointSize: 20)
        let image = UIImage(systemName: "list.bullet.circle", withConfiguration: configure)
        button.setImage(image, for: .normal)
        button.tintColor = .label
        return button
    }()
    
    // MARK: - Initializations
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layouts
    private func configureConstraints() {
        addSubview(locationMapView)
        addSubview(userLocationButton)
        
        let locationMapViewConstraints = [
            locationMapView.leadingAnchor.constraint(equalTo: leadingAnchor),
            locationMapView.trailingAnchor.constraint(equalTo: trailingAnchor),
            locationMapView.topAnchor.constraint(equalTo: topAnchor),
            locationMapView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
        
        let userLocationButtonConstraints = [
            userLocationButton.widthAnchor.constraint(equalToConstant: 40),
            userLocationButton.heightAnchor.constraint(equalToConstant: 40)
        ]
        
        NSLayoutConstraint.activate(locationMapViewConstraints)
        NSLayoutConstraint.activate(userLocationButtonConstraints)
    }
    
    // MARK: - Functions
    // MapSearchView의 위치에 맞춰 userLocationButton의 위치 조정
    func positionUserLocationButton(relativeTo searchViewTopAnchor: NSLayoutYAxisAnchor) {
        userLocationButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        userLocationButton.bottomAnchor.constraint(equalTo: searchViewTopAnchor, constant: -10).isActive = true
    }
}

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
        
        let locationMapViewConstraints = [
            locationMapView.leadingAnchor.constraint(equalTo: leadingAnchor),
            locationMapView.trailingAnchor.constraint(equalTo: trailingAnchor),
            locationMapView.topAnchor.constraint(equalTo: topAnchor),
            locationMapView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(locationMapViewConstraints)
    }
}

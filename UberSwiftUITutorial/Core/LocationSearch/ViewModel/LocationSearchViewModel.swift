//
//  LocationSearchViewModel.swift
//  UberSwiftUITutorial
//
//  Created by Andrey Panov on 28/05/2023.
//

import Foundation
import MapKit

class LocationSearchViewModel: NSObject, ObservableObject {
    
    @Published var results = [MKLocalSearchCompletion]()
    @Published var selectedLocationCoordinate: CLLocationCoordinate2D?
    
    private let searchCompleter = MKLocalSearchCompleter()
    var queryFragment: String = "" {
        didSet {
            searchCompleter.queryFragment = queryFragment
        }
    }
    
    override init() {
        super.init()
        
        searchCompleter.delegate = self
        searchCompleter.queryFragment = queryFragment
    }
    
    // MARK: - Helpers
    
    func selectLocation(_ localSearch: MKLocalSearchCompletion) {
        locationSearch(forLocalSearchComplition: localSearch) { response, error in
            if let error = error {
                print("DEBUG error \(error.localizedDescription)")
                return
            }
            guard let item = response?.mapItems.first else { return }
            self.selectedLocationCoordinate = item.placemark.coordinate
            let coordinate = item.placemark.coordinate
        }
    }
    
    func locationSearch(forLocalSearchComplition localSearch: MKLocalSearchCompletion, completion: @escaping MKLocalSearch.CompletionHandler) {
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = localSearch.title.appending(localSearch.subtitle)
        let search = MKLocalSearch(request: searchRequest)
        search.start(completionHandler: completion)
    }
}

// MARK: - MKLocalSearchCompleterDelegate

extension LocationSearchViewModel: MKLocalSearchCompleterDelegate {
    
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        self.results = completer.results
    }
}

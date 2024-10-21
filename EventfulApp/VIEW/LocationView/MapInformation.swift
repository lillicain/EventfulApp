//
//  MapInformation.swift
//  EventfulApp
//
//  Created by Lilli Cain on 10/21/24.
//

import SwiftUI
import MapKit
import CoreLocationUI

struct MapInformation: View {
    
    @Namespace var mapScope
    
    var body: some View {
        Map(scope: mapScope)
            .overlay {
                VStack {
                    MapUserLocationButton(scope: mapScope)
                    MapPitchToggle(scope: mapScope)
                    
                    MapCompass(scope: mapScope)
                        .mapControlVisibility(.visible)
                }
                .padding()
                .buttonBorderShape(.circle)
            }
            .mapScope(mapScope)
    }
}

/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A concrete implementation of MKAnnotation representing one bike.
*/

import MapKit

class Bike: MKPointAnnotation {

    class func bikes(_ locations: [Location]) -> [MKPointAnnotation] {
        let bikes = locations.map{ location -> MKPointAnnotation in
            let bike = MKPointAnnotation()
            bike.coordinate = CLLocationCoordinate2DMake(location.latitude, location.longitude)
            return bike
        }
        return bikes
    }

}

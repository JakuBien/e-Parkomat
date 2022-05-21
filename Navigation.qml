import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import GeneralMagic 2.0
import QtLocation 5.15
import QtPositioning 5.15

Item {
    Component.onCompleted: {
        ServicesManager.settings.allowInternetConnection = true
        map.centerOnCoordinates(initialCenter, map.maxZoomLevel - 34);
    }

    function distance(meters) {
        return meters >= 1000 ? (meters / 1000.).toFixed(3) + " km" : meters.toFixed(0) + " m";
    }

    //Wyswietlanie mapy
    MapView{
        id: map
        anchors.fill: parent

        //Aktulane wspolrzedne uzytkownika
        Coordinates {
            id: initialCenter
            latitude: nav.getLatitude();
            longitude: nav.getLongitude();
        }

        //Przyciski na dole
        BottomFrame {
            id: bottomframe
            anchors {
                bottom: parent.bottom
            }
        }

        //Przycisk do odpalenia nawigacji
        Button {
            anchors {
                right: parent.right
                bottom: bottomframe.top
                margins: 5
            }
            enabled: map.routeCollection.mainRoute.valid
            text: navigation.active ? "Stop navigation" : "Start navigation"
            onClicked: navigation.active = !navigation.active
        }

        //Przycisk do znalezienia trasy
        Button {
            anchors {
                left: parent.left
                bottom: bottomframe.top
                margins: 5
            }
            enabled: !navigation.active
            text: "Compute routes"
            onClicked: routing.update()

        }

        //Panel kolejnych instrukcji nawigacji
        Rectangle {
            anchors {
                top: parent.top
                left: parent.left
                right: parent.right
            }
            height: parent.height * 0.1
            color: Qt.rgba(1, 1, 1, .7)
            visible: navigation.active

            RowLayout {
                anchors.fill: parent
                DynamicIconView {
                    Layout.fillHeight: true
                    width: height
                    arrowInner: "darkblue"
                    arrowOuter: "gold"
                    slotInner: "grey"
                    slotOuter: arrowOuter
                    iconSource: navigation.currentInstruction.nextTurnDynamicIcon
                }

                Label {
                    Layout.fillWidth: true
                    font.pixelSize: 16
                    text: navigation.currentInstruction.nextStreetName
                    + " ( " + distance(navigation.currentInstruction.distanceToNextTurn) + " ) "
                }
            }

        }

        onRouteSelected: {
            routeCollection.mainRoute = route
            centerOnRoute(route)

        }
    }

    //Wybieranie lokalizacji i miejsca docelowego
    RoutingService {
        id: routing
        type: Route.Type.Fastest
        transportMode: Route.TransportMode.Car
        waypoints: LandmarkList {
            Landmark {
                name: "Departure"
                coordinates: Coordinates {
                    latitude: 48.849289
                    longitude: 2.346027
                }
            }

            Landmark {
                name: "Destination"
                coordinates: Coordinates {
                    latitude: 48.874630
                    longitude: 2.331512
                }
            }
        }

        onFinished: {
            map.routeCollection.set(routeList)
            map.centerOnRouteList(routeList)
        }
    }

    //System nawigacji
    NavigationService {
        id: navigation
        route: map.routeCollection.mainRoute
        simulation: true

        onActiveChanged: {
            if(active){
                map.startFollowingPosition()
                map.routeCollection.clear()
                map.routeCollection.add(route)
            }
        }

        onDestinationReached: map.routeCollection.clear()
        onNavigationRouteUpdated: {
            map.routeCollection.clear()
            map.routeCollection.add(route)
        }
    }

}

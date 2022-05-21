import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3

Item {
    id: bottomFrame
    width:  root.width
    height: root.height * 0.1
    anchors {
        bottom: root.bottom
    }


    Button {
        id: mainButton
        width: parent.width / 3
        height: parent.height
        anchors.left: parent.left
        Image {
            id: mainButtonImage
            width: parent.height * 0.75
            height: parent.height * 0.75
            anchors.centerIn: parent
            source: "/images/home.png"
        }

        onClicked: root.navigate("MainWindow")
    }

    Button {
        id: gpsButton
        width: parent.width / 3
        height: parent.height
        anchors.left: mainButton.right
        Image {
            id: gpsButtonImage
            width: parent.height * 0.75
            height: parent.height * 0.75
            anchors.centerIn: parent
            source: "/images/location-pin.png"
        }
        onClicked: root.navigate("Navigation")
    }

    Button {
        id: settingsButton
        width: parent.width / 3
        height: parent.height
        anchors.left: gpsButton.right
        Image {
            id: settingsButtonImage
            width: parent.height * 0.75
            height: parent.height * 0.75
            anchors.centerIn: parent
            source: "/images/settings.png"
        }
    }

}

import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3

Popup {
    id: parkingslot
    height: mainwindow.height * 0.6
    width: mainwindow.width * 0.6
    anchors.centerIn: parent

    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent

    Rectangle {
        id:parkingslotback
        width: parent.width
        height: parent.height
        anchors.fill: parent

        color: "#246ee9"
        radius: 5

        Text {
            id: parkingslotext
            width: parent.width * 0.6
            height: parent * 0.2
            anchors {
                top: parent.top
                horizontalCenter: parent.horizontalCenter
            }

            text: qsTr("Parking slot.")
        }

        Button {
            id: closeparkingslot
            width: parent.width * 0.2
            height: parent.height * 0.1
            anchors {
                bottom: parent.bottom
                horizontalCenter: parent.horizontalCenter
                margins: parent.width * 0.1
            }
            text: "Close"

            onClicked: parkingslot.close();

            background: Rectangle {
                anchors.fill: parent
                width: parent.width
                height: parent.height

                color: "white"
                radius: 5
            }
        }

    }
}


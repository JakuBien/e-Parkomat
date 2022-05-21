import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3

Item {
    id: mainwindow
    width: parent.width
    height: parent.height
    visible: true

    Image {
        id: parkomatLogo

        y: parent.height * 0.05
        width: parent.width
        height: parent.height * 0.1
        source: "/images/Parkomat_logo.png"
        transformOrigin: Item.Top
        fillMode: Image.PreserveAspectFit
    }


    Rectangle {
        id: mainwindowback
        width: parent.width * 0.75
        height: parent.height * 0.75
        radius: 5
        color: "#ffffff"
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: parkomatLogo.bottom
        }

        ListModel {
            id: parkinglistmodel

            //Tu bede dodawal kolejne elementy do mojej listy przy pomocy funkcji
        }

        Component {
            id: slot
            Rectangle {
                width: mainwindowback.width
                height: mainwindowback.height * 0.15
                color: 'grey'
                border.width: 2
                border.color: 'white'
                radius: 3

                Button {
                    anchors.fill: parent
                    text: ""
                    onClicked: parkingslot.open();

                    Column {
                        spacing: 2
                        Text {
                            text: '<b>Location:</b> ' + local
                        }
                        Text {
                            text: '<b>Time:</b> ' + time
                        }
                        Text {
                            text: '<b>Car:</b> ' + car
                        }
                    }
                }

            }
        }


        ListView {
            id: parkinglistview
            anchors.fill: parent
            model: parkinglistmodel
            clip: true
            delegate: slot
        }


        ParkingSlot {
            id: parkingslot
        }

        ParkingFee {
            id: parkingfee
        }


        RoundButton {
            id: addButton
            width: parent.width * 0.15
            height: parent.width * 0.15
            hoverEnabled: true

            Text {
                id: controlText
                anchors.fill: parent
//                bottomPadding: 7
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.bold: true
                font.pixelSize: 30
                color: "white"
                text: '+'
            }

            background: Rectangle {
                id: frame6
                color: "#246ee9"
                width: parent.width
                height: parent.height
                radius: 50
            }

            anchors {
                horizontalCenter: parent.horizontalCenter
                bottomMargin: mainwindowback.width * 0.1
                bottom: mainwindowback.bottom
            }

            onClicked: parkingfee.open();

        }
    }

    BottomFrame {
        id: bottomFrame
        anchors {
            bottom: parent.bottom
        }
    }
}


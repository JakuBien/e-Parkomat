import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3


Popup {
    id:parkingfee
    width: mainwindowback.width
    height: mainwindowback.height
    anchors.centerIn: parent

    closePolicy: Popup.CloseOnEscape

    background: Rectangle {
        anchors.fill: parent
        color: "#246ee9"
    }


    Column {
        id: parkingfeecolumn
        width: parent.width * 0.9
        height: parent.height * 0.8
        anchors {
            centerIn: parent
            margins: parent.width * 0.5
        }
        spacing: parent.height * 0.01


        Row {
            width: parent.width
            height: parent.height * 0.2
            spacing: parkingfee.width * 0.05

            Image {
                source: "/images/location-pin.png"
                width: comboboxlocal.height
                height: comboboxlocal.height
            }

            ComboBox {
                id: comboboxlocal
                width: parent.width * 0.75
                height: parent.height * 0.5

                editable: true
                model: ListModel {
                    id: model1
                    ListElement { text: "..." }
                    ListElement { text: "Warszawa" }
                    ListElement { text: "Piaseczno" }
                    ListElement { text: "Radom" }
                    ListElement { text: "Siedlce" }
                }
                onAccepted: {
                    if (find(editText) === -1){
                        model.append({text: editText})
                    }
                }

                property string local: currentText;
            }
        }


        Row {
            width: parent.width
            height: parent.height * 0.2
            spacing: parkingfee.width * 0.05


            Image {
                source: "/images/time-left.png"
                width: comboboxtime.height
                height: comboboxtime.height
            }

            ComboBox {
                id: comboboxtime
                width: parent.width * 0.75
                height: parent.height * 0.5


                editable: true
                model: ListModel {
                    id: model2
                    ListElement { text: "..." }
                    ListElement { text: "45 min" }
                    ListElement { text: "1 h" }
                    ListElement { text: "2 h" }
                    ListElement { text: "3 h" }
                }
                onAccepted: {
                    if (find(editText) === -1){
                        model.append({text: editText})
                    }
                }

                property string time: currentText;

            }
        }


        Row {
            width: parent.width
            height: parent.height * 0.2
            spacing: parkingfee.width * 0.05


            Image {
                source: "/images/money.png"
                width: textback.height
                height: textback.height
            }

            Rectangle {
                id: textback
                width: parent.width * 0.75
                height: parent.height * 0.5
                color: 'white'

                Text {
                    text: "Money"
                    color: 'black'
                }
            }
        }


        Row {
            width: parent.width
            height: parent.height * 0.2
            spacing: parkingfee.width * 0.05


            Image {
                source: "/images/car.png"
                width: comboboxtime.height
                height: comboboxtime.height
            }

            ComboBox {
                id: comboboxcar
                width: parent.width * 0.75
                height: parent.height * 0.5

                editable: true
                model: ListModel {
                    id: model4
                    ListElement { text: "..." }
                    ListElement { text: "WPI89642" }
                    ListElement { text: "WN89891" }
                    ListElement { text: "WPI12345" }
                }
                onAccepted: {
                    if (find(editText) === -1){
                        model.append({text: editText})
                    }
                }

                property string car: currentText;
            }
        }

        //Ta funkcja jest odpowiedzialna za dodawanie nowych rekordow to listy
        function addParkingSlot(local, time, car) {
            if(local === "..." || time === "..." || car === "..."){
                console.log("Error. Choose all options");
            }else{
                parkinglistmodel.append({ "local": local, "time": time, "car": car });
            }
        }


        Row {
            width: parent.width
            height: parent.height * 0.2
            spacing: parent.width * 0.45

            Button {
                id: cancelbutton
                height: parent.height / 2
                width: parent.width / 4
                Text {
                    anchors.centerIn: parent
                    text: "<b>Back</b>"
                    color: 'black'
                }
                onClicked: parkingfee.close();
            }

            Button {
                id: purchasebutton
                height: parent.height/2
                width: parent.width / 4
                Text {
                    anchors.centerIn: parent
                    text: "<b>Buy</b>"
                    color: 'black'
                }
                onClicked: {
                    parkingfeecolumn.addParkingSlot(comboboxlocal.local, comboboxtime.time, comboboxcar.car);
                    parkingfee.close();
                }
            }
        }
    }
}


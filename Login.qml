import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3

Item {
    id: loginItem
    width: 512
    height: 720
    visible: true

    Image {
        id: parkomatLogo

        y: parent.height * 0.15
        width: parent.width
        height: parent.height * 0.1
        source: "/images/Parkomat_logo.png"
        transformOrigin: Item.Top
        fillMode: Image.PreserveAspectFit
    }

    Column {
        id: loginColumn
        width: parent.width/1.5
        height: parent.height/3
        transformOrigin: Item.Center
        anchors.centerIn: parent

        spacing: 20

        TextField {
            id: usernameInput
            width: parent.width
            height: parent.height * 0.2
            opacity: 1
            color: "black"
            text: ""
            font.pixelSize: 23

            verticalAlignment: Text.AlignVCenter
            placeholderText: "Username"
            placeholderTextColor: "#49000000"
            overwriteMode: false
            selectionColor: "#ffffff"
            transformOrigin: Item.Center
            font.family: "Verdana"

            background: Rectangle {
                id: frame1
                width: parent.width
                height: parent.height
                border.color: 'white'
                radius: 10
            }
        }

        TextField {
            id: passwordInput
            width:  parent.width
            height: parent.height * 0.2
            color: "black"

            verticalAlignment: Text.AlignVCenter
            placeholderText: "Password"
            placeholderTextColor: "#49000000"
            font.family: "Verdana"
            font.pixelSize: 23
            echoMode: TextInput.Password

            background: Rectangle {
                id: frame2
                width: parent.width
                height: parent.height
                border.color: 'white'
                radius: 10
            }
        }

        Button {
            id: loginButton
            width: parent.width
            height: parent.height * 0.2
            text: qsTr("Login")
            font.pointSize: 20
            hoverEnabled: false

            background: Rectangle {
                id: frame3
                width: parent.width
                height: parent.height
                border.color: 'white'
                radius: 10
            }

            onClicked: {
                db.connectBase();
                root.navigate("MainWindow");
//                if(db.loginToBase(usernameInput.text, passwordInput.text)) {
//                    root.navigate("MainWindow");
//                }
            }
        }

        Button {
            id: singupButton
            width: parent.width
            height: parent.height * 0.2
            text: qsTr("Sign up")
            font.bold: true
            font.pointSize: 20
            hoverEnabled: false


            background: Rectangle {
                id: frame4
                width: parent.width
                height: parent.height
                color: "#00ffffff"
                border.color: "#00ffffff"
                border.width: 5
                radius: 10
            }

            onClicked: stackview.push("qrc:///Registration.qml")
        }

    }

}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.5}D{i:1}D{i:3}D{i:5}D{i:7}D{i:9}D{i:2}
}
##^##*/


import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3

Window {
    id: root
    width: 512
    height: 720
    visible: true
    color: "#246ee9"


    Loader {
        id: loader
        anchors.fill: parent
        source: "qrc:///StackViewPage.qml"
    }

    function navigate(page){
        loader.source = "qrc:///" + page + ".qml";
    }

}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.5}D{i:2}D{i:1}
}
##^##*/


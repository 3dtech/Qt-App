import QtQuick 2.4
import external.WayfinderQML 1.0 as Wayfinder

Item {
    id: item3
    anchors.fill: parent

    Text {
        id: text3
        anchors.centerIn: parent
        text: qsTr("Map")
        font.pixelSize: 30
    }

    /*Wayfinder2D {
        anchors.fill: parent
    }*/

    visible: false
    states: [
        State {
            name: "active"
            when: (mainItem.state == "state3")
            PropertyChanges {
                target:  item3
                visible: true
                restoreEntryValues: true
            }
        }
     ]
}

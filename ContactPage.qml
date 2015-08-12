import QtQuick 2.4

Item {
    id: item4
    anchors.fill: parent

    Text {
        id: text4
        anchors.centerIn: parent
        text: qsTr("Contact")
        font.pixelSize: 30
    }
    visible: false
    states: [
        State {
            name: "active"
            when: (mainItem.state == "state4")
            PropertyChanges {
                target:  item4
                visible: true
                restoreEntryValues: true
            }
        }
     ]
}


import QtQuick 2.4

Item {
    id: item1
    anchors.fill: parent

    Text {
        id: text1
        anchors.centerIn: parent
        text: qsTr("Directory")
        font.pixelSize: 30
    }

    visible: false
    states: [
        State {
            name: "active"
            when: (mainItem.state == "state1")
            PropertyChanges {
                target:  item1
                visible: true
                restoreEntryValues: true
            }
        }
     ]
}


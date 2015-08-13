import QtQuick 2.4
import "external/JSONListModel" as JSON
Item {
    id: item2
    anchors.fill: parent

    JSON.JSONListModel{
        id: azModel
        source: "/data/locations.json"
        query: "$.data[*]"
    }
    ListView {
        anchors.fill: parent
        clip: true
        height : 200
        width : 200
        model: azModel.model
        delegate: Component {
            Row {
                spacing: 20

                Text {
                    id: text1
                    text: "blah"
                }

                Text {
                    id: text2
                    text: model.names_en
                }
                Text {

                  //  text: model.description_en
                }
            }
        }
    }

    Text {
        id: text2
        anchors.centerIn: parent
        text: qsTr("A-Z")
        font.pixelSize: 30
    }
    visible: false
    states: [
        State {
            name: "active"
            when: (mainItem.state == "state2")
            PropertyChanges {
                target:  item2
                visible: true
                restoreEntryValues: true
            }
        }
     ]
}

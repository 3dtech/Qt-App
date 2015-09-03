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
    Component {
        id: azComponent
        Row{


           /* Rectangle {
            anchors.fill: parent
            color: "#d3d919"*/
            width: parent.width
            height: childrenRect.height
            Rectangle{
                width: parent.width+1 
                height: childrenRect.height
                //color: "#d5a522"
                border.color: "#878d85"
                anchors.centerIn: parent
                Text {
                    anchors.left: parent.left
                    anchors.leftMargin: 40

                    text: model.names_en
                }
               /* width: 100
                height: 100*/
            }
        }
    }

    ListView {
        anchors.bottom: parent.bottom
        anchors.left: parent.left+20
        height: parent.height/5*3
        width:parent.width-40
        clip: true
        /*height : 200
        width : 200*/
        model: azModel.model
        delegate: azComponent
            /*Component {
            Row {
                spacing: 20

                Text {
                    id: text1
                }

                Text {
                    id: text2
                    text: model.names_en
                }
                Text {

                    text: model.descriptions_en
                }
            }
        }*/
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

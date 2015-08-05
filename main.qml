import QtQuick 2.4
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.3
import "external/JSONListModel" as JSON

ApplicationWindow {
    id: applicationWindow1
    title: qsTr("Hello World")
    width: 640
    height: 480
    visible: true

    JSON.JSONListModel{
        id: azModel
        source: "/data/locations.json"
        query: "$.data[*]"
    }

    /*JSON.JSONListModel{
        id: azModel
        json: '\
            {"data":[{"names_en":"1","description_en":"2"},{"g":"3"}]}\
        '
        query: "$.data[*]"
    }*/


    ListModel {
        id: buttonRow1Model
        ListElement { nr:1; name:"directoryButton"; textAttribute: "Directory"; image1:"icons/icon1.png"; image2: "icons/icon1_selected.png" }
        ListElement { nr:2; name:"aZButton"; textAttribute: "A-Z"; image1:"icons/icon3.png"; image2: "icons/icon3_selected.png" }
        ListElement { nr:3; name:"mapButton"; textAttribute: "Map"; image1:"icons/icon2.png"; image2: "icons/icon2_selected.png" }
        ListElement { nr:4; name:"contactButton"; textAttribute: "Contact"; image1:"icons/icon4.png"; image2: "icons/icon4_selected.png" }
    }
    Component {
        id: bottomButtonDelegate
        Button {
            id: thisbutton
            style: bottomButtonStyle
            exclusiveGroup: bottomTabExclusive
            Item {
                Image {
                    id: theimage1
                    visible: true
                    z: 0
                    source: image1
                    anchors.top : parent.top
                }

                Image {
                    id: theimage2
                    visible: false
                    source: image2
                    anchors.top : parent.top
                }
                Text  {
                    id: thetext
                    text: textAttribute              
                    horizontalAlignment: Text.AlignHCenter
                    font.pointSize: 7
                    anchors.top: theimage1.bottom
                    anchors.bottomMargin: 0
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: childrenRect.width
                }
                anchors.centerIn: parent
                width: childrenRect.width
                height: childrenRect.height

            }

            anchors.topMargin: parent.height/2-height/2
            anchors.top: parent.top
            property int usednr:(nr==0)?1:nr
            anchors.leftMargin: parent.width/(parent.parent.nrofMenuButtons+2)*usednr //(parent.nrOfMenuButtons+2)*(usednr+1)
            anchors.left: parent.left
            transformOrigin: Item.Center
            width: parent.width/(parent.parent.nrofMenuButtons+2)
            height: parent.parent.height
            z: 0
            checkable: true

            states: [
                State {
                    name: "state1"
                    when: !thisbutton.checked
                    PropertyChanges { target:theimage1; visible: true}
                    PropertyChanges { target:theimage2; visible: false}
                    PropertyChanges {
                        target: thetext
                        color: "#000000"
                    }
                },
                State {
                    name: "state2"
                    when: thisbutton.checked
                    PropertyChanges { target:theimage2; visible: true}
                    PropertyChanges { target:theimage1; visible: false}
                    PropertyChanges {
                        target: thetext
                        color: "#F99400"
                    }
                }
            ]
            onClicked: {
                console.log ( "azModel=",azModel.model)
            }
            onCheckedChanged: {
                if (thisbutton.checked )
                    mainItem.state="state"+nr
                //thisbutton.state= (checked == false) ?  "state1" : "state2"
            }
        }
    }

    menuBar: MenuBar {
        Menu {
            title: qsTr("&File")
            MenuItem {
                text: qsTr("&Open")
            }
            MenuItem {
                text: qsTr("E&xit")
                onTriggered: Qt.quit();
            }
        }
    }

    Row {
        id: buttonRow1
        property int nrofMenuButtons: 4
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.topMargin: parent.height-parent.height/10
        anchors.bottom: parent.bottom

        ExclusiveGroup {
            id: bottomTabExclusive
        }

        ListView {
            property int nrofMenuButtons: 4
            anchors.fill: parent
            model: buttonRow1Model
            delegate: bottomButtonDelegate

        }
    }

    Item {
        id: mainItem
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: buttonRow1.top

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

        Item {
            id: item2
            anchors.fill: parent
            ListView {
                anchors.fill: parent
                clip: true
                height : 200
                width : 200
                model: azModel.model
                /*itemDelegate: Item {
                    Text {
                        color: "#000000"
                        anchors.verticalCenter: parent.verticalCenter

                        elide: styleData.elideMode
                        text: styleData.value
                    }
                }*/
                delegate: Component {
                    Row {
                        spacing: 20
                        //anchors.top: parent.top
                        //anchors.centerIn: parent
                        Text {
                            id: text1
                            text: "blah"
                        }

                        Text {
                            id: text2
                            text: model.names_en
                        }
                        Text {

                            text: model.description_en
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

        Item {
            id: item3
            anchors.fill: parent

            Text {
                id: text3
                anchors.centerIn: parent
                text: qsTr("Map")
                font.pixelSize: 30
            }
            PinchArea {
               // pinch.target: parent
                z: 1
                anchors.fill: parent
                onPinchUpdated: {
                    console.log( "pinch detexted imagex=",mapimage.x)
                    mapimage.scale = (pinch.scale)
                    mapFlickable.contentHeight = mapimage.height* mapimage.scale
                    mapFlickable.contentWidth = mapimage.width * mapimage.scale
                }
                Flickable {
                    id: mapFlickable
                    anchors.fill: parent
                    boundsBehavior: Flickable.StopAtBounds
                    contentHeight: contentItem.childrenRect.height
                    contentWidth: contentItem.childrenRect.width
                    contentItem.anchors.top: parent.top
                    contentItem.anchors.left: parent.left
                    Image {
                        id: mapimage
                        anchors.left: parent.left
                        anchors.top: parent.top
                        width: 2000
                        height: 2000
                        source: "data/map.jpg"
                        //anchors.fill: parent
                    }
                }
            }
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
    }
    ButtonStyle {
        id: bottomButtonStyle
        background: Rectangle {
            color: "green"
            //implicitWidth: 100
            //implicitHeight: 25
            border.width: 10
            border.color: "#f00"
            radius: 4
        }
    }
}

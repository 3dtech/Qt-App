import QtQuick 2.4
import QtQuick.Controls 1.3
//import QtQuick 5.5
//import QtQuick.Dialogs 1.2
import QtQuick.Controls.Styles 1.3

ApplicationWindow {
    id: applicationWindow1
    title: qsTr("Hello World")
    width: 640
    height: 480
    visible: true

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
            //eval(id = "button"+nr);
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
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.pointSize: 7
                    anchors.bottom: parent.bottom
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
                    PropertyChanges { target:theimage1; visible: true}
                    PropertyChanges { target:theimage2; visible: false}
                    PropertyChanges {
                        target: thetext
                        styleColor: "#000000"
                    }
                },
                State {
                    name: "state2"
                    PropertyChanges { target:theimage2; visible: true}
                    PropertyChanges { target:theimage1; visible: false}
                    PropertyChanges {
                        target: thetext
                        styleColor: "#F99400"
                    }
                }
            ]
            onClicked: {
                mainItem.state="state1"

            }
            onCheckedChanged: {
                thisbutton.state= (checked == false) ?  "state1" : "state2"
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
        id: row1
        property int nrofMenuButtons: 4
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.topMargin: parent.height-parent.height/10
        anchors.bottom: parent.bottom


        ListView {
            property int nrofMenuButtons: 4
            anchors.fill: parent
            model: buttonRow1Model
            delegate: bottomButtonDelegate

        }
    }

    Item {
        id: mainItem
        x: 48
        y: 188
        width: 200
        height: 200
        states: [
            State {
                name: "state1"
                //PropertyChanges { target:grid2; visible: true}
            },
            State {
                name: "state2"
                //PropertyChanges { target:grid2; visible: false}
            }
        ]
    }

    ToolButton {
        id: toolButton1
        x: 118
        y: 106
        iconSource: "icons/icon3.png"
        iconName: "icons/icon3.png"
        checkable: true
        checked: false
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

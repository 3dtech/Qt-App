import QtQuick 2.4
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.3
Item {
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
            }
            onCheckedChanged: {
                if (thisbutton.checked )
                    mainItem.state="state"+nr
            }
        }
    }
    Item {
        property int nrofMenuButtons: 4
        anchors.fill: parent
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

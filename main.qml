import QtQuick 2.4
import QtQuick.Controls 1.4

ApplicationWindow {
    id: applicationWindow1
    title: qsTr("Wayfinder")
    width: 640
    height: 480
    visible: true


    MainButtonRow {
        id: mainButtonRow
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        width: parent.width
        height: parent.height/10
        /*Rectangle {
            border.color: "#ff0000"
            border.width: 2
            anchors.fill: parent
        }*/
    }

    Item {
        id: mainItem
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: mainButtonRow.top
        DirectoryPage {
            anchors.fill: parent
        }

        AZPage {

        }

        MapPage {

        }

        ContactPage {

        }
    }
}

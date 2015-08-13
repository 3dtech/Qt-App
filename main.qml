import QtQuick 2.4
import QtQuick.Controls 1.4

ApplicationWindow {
    id: applicationWindow1
    title: qsTr("Hello World")
    width: 640
    height: 480
    visible: true

    Rectangle {
        border.width: 2
        border.color: "#00FF00"
        anchors.fill: parent
    }

    MainButtonRow{
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

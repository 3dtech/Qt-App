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

    Rectangle {
        border.width: 2
        border.color: "#00FF00"
        anchors.fill: parent
    }

    MainButtonRow{
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        width: childrenRect.width
        height: childrenRect.height
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
        anchors.bottom: buttonRow1.top
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

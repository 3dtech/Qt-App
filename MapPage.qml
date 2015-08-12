import QtQuick 2.4

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
        Rectangle{
            //z:2
            anchors.fill: parent
            color: transparent
            border.width: 2
            border.color: "#3161e2"

        }

       // pinch.target: parent
        z: 1
        anchors.fill: parent
        onPinchUpdated: {
            console.log( "pinch happened, imagex=",mapimage.x,"imageleft=",mapimage.left,"mapflickablex=",mapFlickable.x)
            mapimage.scale = (mapimage.previousscale*pinch.scale)
            mapFlickable.contentHeight = mapFlickable.contentItem.childrenRect.height
            mapFlickable.contentWidth = mapFlickable.contentItem.childrenRect.width
        }
        onPinchFinished: {
            mapimage.previousscale=mapimage.scale
        }


        Flickable {
            id: mapFlickable
            anchors.fill: parent
            boundsBehavior: Flickable.StopAtBounds
            contentHeight: contentItem.childrenRect.height
            contentWidth: contentItem.childrenRect.width
            contentItem.anchors.top: parent.top
            contentItem.anchors.left: parent.left

            Rectangle {
                color: "#beb424"
                anchors.fill: parent
            }

            Image {
                id: mapimage
                property var previousscale: 1
                fillMode: Image.PreserveAspectFit
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

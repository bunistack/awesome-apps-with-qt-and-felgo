import QtQuick 2.0
import AppUtil 1.0

Rectangle {
    id: root
    clip: true

    property string emptyText: ""
    property string emptySVG: ""

    Column{
        anchors.centerIn: parent
        height: childrenRect.height
        width: 320
        spacing: 20

        Image {
            width: 200
            height: 200
            anchors.horizontalCenter: parent.horizontalCenter
            source: emptySVG
            fillMode: Image.PreserveAspectFit
            sourceSize: Qt.size(width, height)
        }

        Text{
            width: parent.width
            height: 20
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 14
            font.family: AppUtil.font1.name
            color: "#323232"
            text: emptyText
        }

    }

}

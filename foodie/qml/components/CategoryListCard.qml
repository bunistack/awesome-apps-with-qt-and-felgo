import QtQuick 2.12
import AppUtil 1.0

import "../controls"

ShadowedRectangle {
    width: 120
    height: 130
    radius: 12

    Column{
        anchors.fill: parent
        topPadding: 10
        spacing: 10

        Image{
            width: 80
            height: 80
            source: icon
            sourceSize: Qt.size(width,height)
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {
            text: name
            width: parent.width
            height: 20
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 15
            font.family: AppUtil.font1.name
            font.bold: true
        }
    }

    // end of root
}

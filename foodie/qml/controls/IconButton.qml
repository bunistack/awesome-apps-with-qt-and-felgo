import QtQuick 2.12

ShadowedRectangle {
    id: root
    width: size
    height: size
    radius: height/2

    property real size: 40
    property real iconMargins: 10

    property alias icon: coloredImage    

    signal clicked()

    ColoredImage{
        id: coloredImage
        anchors.fill: parent
        anchors.margins: iconMargins
    }

    MouseArea{
        anchors.fill: parent
        enabled: parent.enabled
        onClicked: root.clicked()
    }

    // end of root
}

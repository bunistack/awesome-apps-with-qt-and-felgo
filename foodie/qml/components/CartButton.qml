import QtQuick 2.12
import AppUtil 1.0

import "../controls"

IconButton{
    size: 50
    icon.source: "qrc:/assets/images/icons/shopping_cart_grey.png"
    anchors.right: parent.right
    anchors.rightMargin: 20
    anchors.bottom: parent.bottom
    anchors.bottomMargin: 40

    onClicked: {
        mainNavigationStack.push(Qt.resolvedUrl("../pages/Cart.qml"));
    }

    Rectangle{
        width: childrenRect.width
        height: 20
        visible: totalCartQuantity > 0
        radius: width/2
        color: AppUtil.themeColor
        anchors{
            right: parent.right
            rightMargin: 7
            top: parent.top
            topMargin: 7
        }

        Text {
            text: totalCartQuantity
            width: contentWidth + 5 < height ? height : contentWidth + 5
            height: parent.height
            font.family: AppUtil.font1.name
            font.pixelSize: 14
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            color: "white"
        }
    }

}

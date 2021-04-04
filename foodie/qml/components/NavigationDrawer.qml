import QtQuick 2.12
import QtQuick.Controls 2.12
import AppUtil 1.0

import "../models"

Drawer {
    id: root
    edge: Qt.LeftEdge
    width: 220
    height: parent.height
    modal: false

    background: Rectangle{
        color: AppUtil.themeColor
    }

    property int currentIndex: 0

    signal menuItemClicked(int index)

    ListView{
        anchors.fill: parent
        anchors.topMargin: 40
        headerPositioning: ListView.OverlayHeader
        model: DrawerModel{}

        header: Item {
            width: parent.width
            height: 150

            Image{
                anchors.fill: parent
                anchors.margins: 20
                sourceSize: Qt.size(width,height)
                fillMode: Image.PreserveAspectFit
                source: "qrc:/assets/images/logos/logo_long_transparent.png"
            }
        }

        delegate: Rectangle{
            width: parent.width
            height: 60
            color: currentIndex === index || menuItemMouseArea.containsMouse ? AppUtil.themeColorDark : "transparent"

            Row{
                anchors.fill: parent
                spacing: 30
                leftPadding: 30

                Image {
                    source: itemIcon
                    width: 30
                    height: 30
                    anchors.verticalCenter: parent.verticalCenter
                    sourceSize: Qt.size(width, height)
                }

                Text {
                    text: itemText
                    height: parent.height
                    verticalAlignment: Text.AlignVCenter
                    font.pixelSize: 16
                    font.family: AppUtil.font1.name
                    font.bold: true
                    color: AppUtil.textColor
                }
            }

            MouseArea{
                id: menuItemMouseArea
                anchors.fill: parent
                hoverEnabled: true

                onClicked: {
                    currentIndex = index;
                    root.close();
                    menuItemClicked(index);
                }

            }

            // end of delegate
        }
        // end of ListView
    }

    // end of root
}

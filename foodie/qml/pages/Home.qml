import QtQuick 2.12

import "../controls"

FelgoPage {
    id: root

    property real scrollPosition: 0

    Column{
        anchors.fill: parent

        ShadowedRectangle{
            id: header
            width: parent.width
            height: 60
            shadowEnabled: scrollPosition > 0
            z: 5

            Row {
                width: childrenRect.width
                height: parent.height
                spacing: 15
                leftPadding: 20

                Image {
                    width: 30
                    height: 30
                    anchors.verticalCenter: parent.verticalCenter
                    source: "qrc:/assets/images/icons/hamburger_menu_grey.png"

                    MouseArea{
                        anchors.fill: parent
                        onClicked: navigationDrawer.open()
                    }
                }

                // end of first row
            }
        }

        // end of Column
    }

    // end of root
}

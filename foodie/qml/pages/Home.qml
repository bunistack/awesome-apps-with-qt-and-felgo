import QtQuick 2.12
import AppUtil 1.0

import "../controls"

FelgoPage {
    id: root   

    Column{
        anchors.fill: parent

        ShadowedRectangle{
            id: header
            width: parent.width
            height: 60
            shadowEnabled: scrollView.position
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

        CustomScrollView {
            id: scrollView
            width: parent.width
            height: parent.height - header.height
            clip: true
            contentWidth: -1

            Flow{
                width: parent.width
                height: childrenRect.height
                topPadding: 20
                bottomPadding: 20
                spacing: 20

                onWidthChanged: {

                    let cols = Math.floor(width/360);

                    if(cols < 2){
                        leftPadding = (width-320)/2 < 20 ? 20 : (width-320)/2;
                        return;
                    }

                    leftPadding = (width - ((320*cols) + ((cols-1)*spacing)))/2;

                }

                Item {
                    width: parent.width - (parent.leftPadding * 2)
                    height: 35

                    Text {
                        width: contentWidth
                        height: parent.height
                        text: "Categories"
                        font.family: AppUtil.font1.name
                        font.pixelSize: 18
                        font.bold: true
                        verticalAlignment: Text.AlignVCenter
                    }
                }

                // end of flow
            }

            // end of CustomScrollView
        }

        // end of Column
    }

    // end of root
}

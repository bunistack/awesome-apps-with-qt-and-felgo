import QtQuick 2.12
import AppUtil 1.0

import "../controls"

ShadowedRectangle {
    width: 320
    height: 130
    radius: 12

    Row{
        anchors.fill: parent
        anchors.margins: 10
        spacing: 10

        Item {
            width: 130
            height: parent.height

            Image{
                width: 110
                height: 110
                sourceSize: Qt.size(width,height)
                anchors.centerIn: parent
                source: photo
            }
        }

        Column{
            width: parent.width - 140
            height: parent.height
            spacing: 10

            Text {
                width: parent.width
                text: name
                font.family: AppUtil.font1.name
                font.pixelSize: 15
                font.bold: true
                wrapMode: Text.Wrap
            }

            Text {
                width: parent.width
                text: "Ksh. " + Utility.currencyFormat(price)
                font.family: AppUtil.font1.name
                font.pixelSize: 15
            }

            Row{
                width: parent.width
                height: 40
                spacing: 50

                IconButton{
                    size: 35
                    anchors.verticalCenter: parent.verticalCenter
                    iconMargins: 7
                    icon.source: "qrc:/assets/images/icons/add_to_cart_grey.png"

                    onClicked: {
                        addToCart({
                                      name: name,
                                      price: price,
                                      photo: photo,
                                      rating: rating,
                                      category: category
                                  });
                    }
                }

                Row{
                    width: childrenRect.width
                    height: parent.height
                    spacing: 5

                    Image{
                        width: 20
                        height: 20
                        sourceSize: Qt.size(width,height)
                        anchors.verticalCenter: parent.verticalCenter
                        source: "qrc:/assets/images/icons/rating_grey.png"
                    }

                    Text {
                        width: contentWidth
                        height: parent.height
                        verticalAlignment: Text.AlignVCenter
                        text: rating
                        font.family: AppUtil.font1.name
                        font.pixelSize: 15
                    }
                }
            }
        }

        // end of row
    }

    // end of root
}

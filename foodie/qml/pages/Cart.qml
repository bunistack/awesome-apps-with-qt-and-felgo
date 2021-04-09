import QtQuick 2.12
import QtQuick.Controls 2.12
import AppUtil 1.0
import SVG 1.0

import "../components"
import "../controls"
import "../models"

FelgoPage {
    id: root

    Component.onCompleted: {

    }

    onAppeared: {
        mainAppWindow.showCartButton = false;
    }

    onDisappeared: {
        mainAppWindow.showCartButton = true;
    }

    Column{
        anchors.fill: parent

        ShadowedRectangle{
            id: header
            width: parent.width
            height: 60
            shadowEnabled: scrollView.position > 0 && !navigationDrawer.opened
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

        Item{
            width: parent.width
            height: parent.height - header.height

            CustomScrollView {
                id: scrollView
                anchors.fill: parent
                visible: cartListModel.count > 0
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
                            leftPadding = (width-320)/2 < 10 ? 10 : (width-320)/2;
                            return;
                        }

                        leftPadding = (width - ((320*cols) + ((cols-1)*spacing)))/2;

                    }

                    // cart
                    Item {
                        width: parent.width - (parent.leftPadding * 2)
                        height: 35

                        Text {
                            width: contentWidth
                            height: parent.height
                            text: "Cart"
                            font.family: AppUtil.font1.name
                            font.pixelSize: 23
                            font.bold: true
                            verticalAlignment: Text.AlignVCenter
                        }
                    }

                    Repeater{
                        model: cartListModel

                        CartListCard{

                        }
                    }

                    ShadowedRectangle{
                        width: parent.width - (parent.leftPadding * 2) < 320 ? 320 : parent.width - (parent.leftPadding * 2)
                        height: 160
                        radius: 12

                        Column{
                            width: 320
                            height: parent.height
                            anchors.right: parent.right
                            spacing: 10
                            topPadding: 10

                            Row{
                                width: parent.width - 20
                                height: 20
                                anchors.horizontalCenter: parent.horizontalCenter

                                Text {
                                    text: "Subtotal"
                                    width: parent.width/2
                                    height: parent.height
                                    verticalAlignment: Text.AlignVCenter
                                    font.pixelSize: 15
                                    font.bold: true
                                    font.family: AppUtil.font1.name
                                    color: AppUtil.textColor
                                }

                                Text {
                                    text: "Ksh. 100.00"
                                    width: parent.width/2
                                    height: parent.height
                                    verticalAlignment: Text.AlignVCenter
                                    horizontalAlignment: Text.AlignRight
                                    font.pixelSize: 15
                                    font.bold: true
                                    font.family: AppUtil.font1.name
                                    color: AppUtil.textColor
                                }
                            }

                            Row{
                                width: parent.width - 20
                                height: 20
                                anchors.horizontalCenter: parent.horizontalCenter

                                Text {
                                    text: "VAT"
                                    width: parent.width/2
                                    height: parent.height
                                    verticalAlignment: Text.AlignVCenter
                                    font.pixelSize: 15
                                    font.family: AppUtil.font1.name
                                    color: AppUtil.textColor
                                }

                                Text {
                                    text: "Ksh. 16.00"
                                    width: parent.width/2
                                    height: parent.height
                                    verticalAlignment: Text.AlignVCenter
                                    horizontalAlignment: Text.AlignRight
                                    font.pixelSize: 15
                                    font.family: AppUtil.font1.name
                                    color: AppUtil.textColor
                                }
                            }

                            Rectangle{
                                width: parent.width - 20
                                height: 1.5
                                anchors.horizontalCenter: parent.horizontalCenter
                                color: "#f0f0f0"
                            }

                            Row{
                                width: parent.width - 20
                                height: 20
                                anchors.horizontalCenter: parent.horizontalCenter

                                Text {
                                    text: "Total"
                                    width: parent.width/2
                                    height: parent.height
                                    verticalAlignment: Text.AlignVCenter
                                    font.pixelSize: 15
                                    font.family: AppUtil.font1.name
                                    color: AppUtil.textColor
                                }

                                Text {
                                    text: "Ksh. 116.00"
                                    width: parent.width/2
                                    height: parent.height
                                    verticalAlignment: Text.AlignVCenter
                                    horizontalAlignment: Text.AlignRight
                                    font.pixelSize: 15
                                    font.family: AppUtil.font1.name
                                    color: AppUtil.textColor
                                }
                            }

                            MaterialButton{
                                width: 300
                                height: 40
                                radius: 12
                                text: "Complete your order"
                                backgroundColor: AppUtil.themeColor
                                anchors.horizontalCenter: parent.horizontalCenter

                                onClicked: {

                                }
                            }
                        }
                    }

                    // end of flow
                }

                // end of CustomScrollView
            }

            EmptyPage{
                anchors.fill: parent
                visible: cartListModel.count < 1
                emptyText: "There's nothing in your cart!"
                emptySVG: SVG.empty_cart
            }

            // end of content
        }
    }

    // end of root
}

import QtQuick 2.12
import QtQuick.Controls 2.12
import AppUtil 1.0
import SVG 1.0

import "../controls"

Popup {
    id: root
    modal: true
    width: 320
    height: 400
    x: (parent.width-width)/2
    y: (parent.height-height)/2

    background: Rectangle{
        color: "white"
        radius: 12
    }

    Column{
        anchors.fill: parent
        anchors.margins: 2
        spacing: 15

        Text {
            text: "Confirm Order"
            width: parent.width
            height: 25
            verticalAlignment: Text.AlignVCenter
            color: "#323232"
            font.pixelSize: 18
            font.family: AppUtil.font1.name
            leftPadding: 3
        }

        Text {
            text: "Delivery"
            width: parent.width
            height: 25
            verticalAlignment: Text.AlignVCenter
            color: "#323232"
            font.pixelSize: 15
            font.family: AppUtil.font1.name
            leftPadding: 3
        }

        ButtonGroup {
             id: deliveryOptions
         }

        Column{
            width: parent.width
            height: childrenRect.height
            spacing: 10

            Repeater{
                model: ListModel{

                    ListElement{
                        optionName: "Home Delivery"
                        optionIcon: "qrc:/assets/images/icons/home_grey.png"
                    }

                    ListElement{
                        optionName: "Pickup Station"
                        optionIcon: "qrc:/assets/images/icons/store_grey.png"
                    }
                }

                ShadowedRectangle{
                    width: 300
                    height: 40
                    radius: 12
                    anchors.horizontalCenter: parent.horizontalCenter

                    Row{
                        anchors.fill: parent
                        spacing: 10
                        leftPadding: 10

                        RadioButtonStyle1{
                            width: 40
                            height: 40
                            text: ""
                            ButtonGroup.group: deliveryOptions
                        }

                        Image{
                            width: 25
                            height: 25
                            sourceSize: Qt.size(width,height)
                            anchors.verticalCenter: parent.verticalCenter
                            source: optionIcon
                        }

                        Text {
                            width: contentWidth
                            height: parent.height
                            verticalAlignment: Text.AlignVCenter
                            text: optionName
                            font.family: AppUtil.font1.name
                            font.pixelSize: 15
                            font.bold: true
                        }
                    }
                }

            }

        }

        Text {
            text: "Payment"
            width: parent.width
            height: 25
            verticalAlignment: Text.AlignVCenter
            color: "#323232"
            font.pixelSize: 15
            font.family: AppUtil.font1.name
            leftPadding: 3
        }

        ButtonGroup {
             id: paymentOptions
         }

        Column{
            width: parent.width
            height: childrenRect.height
            spacing: 10

            Repeater{
                model: ListModel{

                    ListElement{
                        optionName: "Visa"
                        optionIcon: "qrc:/assets/images/icons/color/visa_color.png"
                    }

                    ListElement{
                        optionName: "Paypal"
                        optionIcon: "qrc:/assets/images/icons/color/paypal_color.png"
                    }
                }

                ShadowedRectangle{
                    width: 300
                    height: 40
                    radius: 12
                    anchors.horizontalCenter: parent.horizontalCenter

                    Row{
                        anchors.fill: parent
                        spacing: 10
                        leftPadding: 10

                        RadioButtonStyle1{
                            width: 40
                            height: 40
                            text: ""
                            ButtonGroup.group: paymentOptions
                        }

                        Image{
                            width: 25
                            height: 25
                            sourceSize: Qt.size(width,height)
                            anchors.verticalCenter: parent.verticalCenter
                            source: optionIcon
                        }

                        Text {
                            width: contentWidth
                            height: parent.height
                            verticalAlignment: Text.AlignVCenter
                            text: optionName
                            font.family: AppUtil.font1.name
                            font.pixelSize: 15
                            font.bold: true
                        }
                    }
                }

            }

        }

        MaterialButton{
            width: 300
            height: 40
            radius: 12
            text: "Confirm"
            backgroundColor: AppUtil.themeColor
            anchors.horizontalCenter: parent.horizontalCenter

            onClicked: {
                root.close();
                imageMessageDialog.run("Order confirmed!! It will soon be on it's way!",SVG.order_confirmed, clearCart)
            }
        }

        // end of column
    }

    // end of root
}

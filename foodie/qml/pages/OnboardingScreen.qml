import QtQuick 2.12
import QtQuick.Controls 2.12
import AppUtil 1.0
import SVG 1.0

import "../controls"

FelgoPage {
    id: root

    SwipeView{
        id: swipeView
        anchors.fill: parent

        // order view
        Item{

            Column{
                width: 320
                height: childrenRect.height
                spacing: 10
                anchors.centerIn: parent

                Item{
                    width: 200
                    height: 200
                    anchors.horizontalCenter: parent.horizontalCenter

                    Image{
                        anchors.fill: parent
                        anchors.margins: 20
                        source: SVG.online_groceries
                        sourceSize: Qt.size(width, height)
                        fillMode: Image.PreserveAspectFit
                    }
                }

                Text {
                    text: "Order"
                    font.pixelSize: 18
                    font.bold: true
                    font.weight: Font.ExtraBold
                    font.family: AppUtil.font1.name
                    color: AppUtil.textColor
                    horizontalAlignment: Text.AlignHCenter
                    width: 300
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Text {
                    text: "Place your order online wherever you are at any time."
                    font.pixelSize: 15
                    font.family: AppUtil.font1.name
                    color: AppUtil.textColor
                    horizontalAlignment: Text.AlignHCenter
                    wrapMode: Text.Wrap
                    width: 300
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }
        }

        // confirm order view
        Item{

            Column{
                width: 320
                height: childrenRect.height
                spacing: 10
                anchors.centerIn: parent

                Item{
                    width: 200
                    height: 200
                    anchors.horizontalCenter: parent.horizontalCenter

                    Image{
                        anchors.fill: parent
                        anchors.margins: 20
                        source: SVG.order_confirmed
                        sourceSize: Qt.size(width, height)
                        fillMode: Image.PreserveAspectFit
                    }
                }

                Text {
                    text: "Confirmation & Payment"
                    font.pixelSize: 18
                    font.bold: true
                    font.weight: Font.ExtraBold
                    font.family: AppUtil.font1.name
                    color: AppUtil.textColor
                    horizontalAlignment: Text.AlignHCenter
                    width: 300
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Text {
                    text: "Confirm your order and make your payment."
                    font.pixelSize: 15
                    font.family: AppUtil.font1.name
                    color: AppUtil.textColor
                    horizontalAlignment: Text.AlignHCenter
                    wrapMode: Text.Wrap
                    width: 300
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }
        }

        // order on the way view
        Item{

            Column{
                width: 320
                height: childrenRect.height
                spacing: 10
                anchors.centerIn: parent

                Item{
                    width: 200
                    height: 200
                    anchors.horizontalCenter: parent.horizontalCenter

                    Image{
                        anchors.fill: parent
                        anchors.margins: 20
                        source: SVG.on_the_way
                        sourceSize: Qt.size(width, height)
                        fillMode: Image.PreserveAspectFit
                    }
                }

                Text {
                    text: "On the way"
                    font.pixelSize: 18
                    font.bold: true
                    font.weight: Font.ExtraBold
                    font.family: AppUtil.font1.name
                    color: AppUtil.textColor
                    horizontalAlignment: Text.AlignHCenter
                    width: 300
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Text {
                    text: "Sit back and wait for your delivery."
                    font.pixelSize: 15
                    font.family: AppUtil.font1.name
                    color: AppUtil.textColor
                    horizontalAlignment: Text.AlignHCenter
                    wrapMode: Text.Wrap
                    width: 300
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }
        }

        // order delivered view
        Item{

            Column{
                width: 320
                height: childrenRect.height
                spacing: 10
                anchors.centerIn: parent

                Item{
                    width: 200
                    height: 200
                    anchors.horizontalCenter: parent.horizontalCenter

                    Image{
                        anchors.fill: parent
                        anchors.margins: 20
                        source: SVG.package_arrived
                        sourceSize: Qt.size(width, height)
                        fillMode: Image.PreserveAspectFit
                    }
                }

                Text {
                    text: "Delivery"
                    font.pixelSize: 18
                    font.bold: true
                    font.weight: Font.ExtraBold
                    font.family: AppUtil.font1.name
                    color: AppUtil.textColor
                    horizontalAlignment: Text.AlignHCenter
                    width: 300
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Text {
                    text: "In no time your order will be at your doorstep."
                    font.pixelSize: 15
                    font.family: AppUtil.font1.name
                    color: AppUtil.textColor
                    horizontalAlignment: Text.AlignHCenter
                    wrapMode: Text.Wrap
                    width: 300
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }
        }

        // end of SwipeView
    }

    Row{
        width: childrenRect.width
        height: 40
        spacing: 20
        visible: swipeView.currentIndex !== swipeView.count-1
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        anchors.horizontalCenter: parent.horizontalCenter

        TextButton{
            width: 80
            height: 40
            buttonText.text: "Skip"
            buttonText.horizontalAlignment: Text.AlignHCenter

            onClicked: {
                root.navigationStack.clearAndPush(Qt.resolvedUrl("Home.qml"));
            }
        }

        PageIndicatorStyle1 {
            interactive: false
            count: swipeView.count
            currentIndex: swipeView.currentIndex
            anchors.verticalCenter: parent.verticalCenter
        }

        TextButton{
            width: 80
            height: 40
            buttonText.text: "Next"
            buttonText.horizontalAlignment: Text.AlignHCenter
            onClicked: swipeView.incrementCurrentIndex()
        }
    }

    MaterialButton{
        width: 170
        height: 40
        radius: 12
        text: "Get Started"
        visible: swipeView.currentIndex === swipeView.count-1
        backgroundColor: AppUtil.themeColor
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        anchors.horizontalCenter: parent.horizontalCenter

        onClicked: {
            root.navigationStack.clearAndPush(Qt.resolvedUrl("Home.qml"));
        }
    }

    // end of root
}

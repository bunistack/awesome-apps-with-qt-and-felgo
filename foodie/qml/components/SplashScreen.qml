import Felgo 3.0
import QtQuick 2.12
import QtQuick.Window 2.13
import AppUtil 1.0

Window{
    id: splashScreen
    x: mainWindow.x
    y: mainWindow.y
    width: mainWindow.width
    height: mainWindow.height
    visible: true

    property App mainWindow

    property bool closeAppOnClosed: true

    onClosing: {

        if(closeAppOnClosed){
            mainWindow.close();
        }
    }

    Rectangle{
        color: "white"
        anchors.fill: parent

        Column{
            anchors.centerIn: parent
            width: parent.width
            height: childrenRect.height
            spacing: 10

            Image {
                width: 300
                height: 300
                source: "qrc:/assets/images/logos/logo_transparent.png"
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Row{
                width: childrenRect.width
                height: 40
                spacing: 5
                anchors.horizontalCenter: parent.horizontalCenter

                Item{
                    width: 40
                    height: parent.height

                    Image {
                        width: 30
                        height: 30
                        source: "qrc:/assets/images/icons/color/pie_color.png"
                        sourceSize: Qt.size(width,height)
                    }
                }

                Text {
                    width: contentWidth
                    height: parent.height
                    verticalAlignment: Text.AlignVCenter
                    font.pixelSize: 15
                    font.bold: true
                    font.family: AppUtil.font1.name
                    color: "#444B54"
                    text: "version " + AppUtil.appConfiguration.versionname
                }
            }

        }

    }

    Connections{
        target: mainWindow

        onSplashScreenFinished: {
//            mainWindow.opacity = 1;
//            closeAppOnClosed = false;
//            splashScreen.close();
        }
    }
}

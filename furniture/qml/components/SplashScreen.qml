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

    property int defaultStatusBarStyle: 0

    onClosing: {

        if(closeAppOnClosed){
            mainWindow.close();
        }
    }

    Component.onCompleted: {
        defaultStatusBarStyle = Theme.colors.statusBarStyle;
        //Theme.colors.statusBarStyle = Theme.colors.statusBarStyleHidden;
    }

    Rectangle{
        color: "#499C97"
        anchors.fill: parent

        Image {
            anchors.centerIn: parent
            source: "qrc:/assets/images/logos/base-logo.png"
            width: splashScreen.width > 420 ? 400 : 320
            fillMode: Image.PreserveAspectFit
            sourceSize.width: width
        }

    }

    Connections{
        target: mainWindow

        onSplashScreenFinished: {
            //            mainWindow.opacity = 1;
            //            closeAppOnClosed = false;
            //            splashScreen.close();
            //            Theme.colors.statusBarStyle = defaultStatusBarStyle;
        }
    }
}

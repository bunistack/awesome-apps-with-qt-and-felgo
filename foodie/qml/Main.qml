import Felgo 3.0
import QtQuick 2.12
import AppUtil 1.0

import "./components"
import "./controls"

App {
    id: mainAppWindow
    height: 600
    width: 900
    opacity: 0

    onSplashScreenFinished: {
        mainNavigationStack.push(Qt.resolvedUrl("./pages/OnboardingScreen.qml"));
    }

    SplashScreen{
        mainWindow: mainAppWindow
    }        

    Column{
        anchors.fill: parent

        // status bar
        Rectangle{
            id: appStatusBar
            width: parent.width
            height: AppUtil.isMobile() ? (visible ? AppUtil.statusBarHeight() : 0) : 0
            z: 20
        }

        // content
        Item {
            width: parent.width
            height: parent.height - appStatusBar.height

            FelgoNavigationStack{
                id: mainNavigationStack
                anchors.fill: parent
            }

        }

        // end of Column
    }


    // end of root
}

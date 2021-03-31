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
    color: AppUtil.themeColor

    onSplashScreenFinished: {
        mainNavigationStack.push(Qt.resolvedUrl("./pages/OnboardingScreen.qml"));
    }

    SplashScreen{
        mainWindow: mainAppWindow
    }        

    Rectangle{
        width: parent.width
        height: parent.height
        anchors.left: parent.left
        anchors.leftMargin: (navigationDrawer.position * navigationDrawer.width)
        transformOrigin: Item.Left
        scale: 1 - (navigationDrawer.position * 0.2)

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

    }

    NavigationDrawer{
        id: navigationDrawer
    }

    // end of root
}

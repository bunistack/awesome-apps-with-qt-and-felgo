import Felgo 3.0
import QtQuick 2.0
import AppUtil 1.0

import "./components"

App {
    id: mainAppWindow
    width: 900
    height: 600
    opacity: 0
    color: AppUtil.themeColor

    SplashScreen{
        mainWindow: mainAppWindow
    }
}

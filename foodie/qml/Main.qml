import Felgo 3.0
import QtQuick 2.12

import "./components"

App {
    id: mainAppWindow
    height: 600
    width: 900
    opacity: 0

    SplashScreen{
        mainWindow: mainAppWindow
    }

    // end of root
}

import Felgo 3.0 as F
import QtQuick 2.12
import AppUtil 1.0

F.Page {    
    useSafeArea: false

    //status bar color
    property color defaultStatusBarColor: "#ffffff"
    property color statusBarColor: defaultStatusBarColor

    //status bar control
    property bool isStatusBarVisible: true

    onAppeared: {

        // functionality for isStatusBarVisible property
        if(isStatusBarVisible){            
            appStatusBar.visible = true;
        }else{
            appStatusBar.visible = false;
        }

        // status bar color (mobile)
        if(AppUtil.isMobile()){
            if(statusBarColor === defaultStatusBarColor)
                appStatusBar.color = defaultStatusBarColor;
            else
                appStatusBar.color = statusBarColor;
        }
    }

    // end of root
}

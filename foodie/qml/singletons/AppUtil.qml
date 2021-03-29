pragma Singleton

import QtQuick 2.12
import QtQuick.Window 2.13
import Felgo 3.0

QtObject {

    Component.onCompleted: {
        initializeConfiguration();
    }

    /*********************************************
     * function definitions start here
    **********************************************/

    // checks if mobile
    function isMobile(){
        return Theme.isAndroid || Theme.isIos;
    }


    // returns status bar height
    function statusBarHeight(){

        if(Theme.isAndroid){
            return Theme.statusBarHeight / Screen.devicePixelRatio;
        }else{
            return IOSUtils.statusBarHeight();
        }
    }

    // populates appConfiguration property
    function initializeConfiguration(){
        let allText = Utility.readFile(":/qml/config.json");
        appConfiguration = JSON.parse(allText);
    }

    /*********************************************
     * function definitions end here
    **********************************************/



    /*********************************************
     * property definitions start here
    **********************************************/

    // defines Application font
    property QtObject font1: FontLoader{
        source: "qrc:/assets/fonts/VarelaRound-Regular.ttf"
    }

    property color textColor: "#444B54"
    property color themeColor: "#FFC107"

    // defines the app configuration; data is fetched from config.json
    property var appConfiguration

    //end of root
}

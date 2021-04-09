import QtQuick 2.12
import AppUtil 1.0

import "../controls"

CustomScrollView {
    clip: true
    contentWidth: -1

    onPositionChanged: {
        scrollPosition = position;
    }

    property string categoryName: ""
    property ListModel foodsModel

    Flow{
        width: parent.width
        height: childrenRect.height
        topPadding: 20
        bottomPadding: 20
        spacing: 20

        onWidthChanged: {

            let cols = Math.floor(width/360);

            if(cols < 2){
                leftPadding = (width-320)/2 < 10 ? 10 : (width-320)/2;
                return;
            }

            leftPadding = (width - ((320*cols) + ((cols-1)*spacing)))/2;

        }

        // category
        Item {
            width: parent.width - (parent.leftPadding * 2)
            height: 45

            Text {
                width: contentWidth
                height: parent.height
                text: categoryName
                font.family: AppUtil.font1.name
                font.pixelSize: 23
                font.bold: true
                verticalAlignment: Text.AlignVCenter
            }
        }

        Repeater{
            model: foodsModel

            FoodListCard{

            }
        }

    }

    // end of root
}

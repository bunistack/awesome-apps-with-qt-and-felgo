import QtQuick 2.12
import QtQuick.Controls 2.12
import AppUtil 1.0

PageIndicator {
    id: control

    property color color: AppUtil.textColor

    delegate: Rectangle {
        implicitWidth: 8
        implicitHeight: 8

        radius: width / 2
        color: control.color

        opacity: index === control.currentIndex ? 0.95 : pressed ? 0.7 : 0.45

        Behavior on opacity {
            OpacityAnimator {
                duration: 100
            }
        }
    }
}

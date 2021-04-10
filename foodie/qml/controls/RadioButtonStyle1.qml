import QtQuick 2.12
import QtQuick.Controls 2.12
import AppUtil 1.0

RadioButton {
    id: control
    text: qsTr("RadioButton")
    font.family: AppUtil.font1.name
    font.pixelSize: 16

    property real indicatorSize: 26

    indicator: Rectangle {
        implicitWidth: indicatorSize
        implicitHeight: indicatorSize
        x: control.leftPadding
        y: parent.height / 2 - height / 2
        radius: 13
        border.color: control.down ? "#646464" : AppUtil.themeColor
        border.width: 2

        Rectangle {
            anchors.fill: parent
            anchors.margins: 6
            radius: width / 2
            color: control.down ? "#646464" : AppUtil.themeColor
            visible: control.checked
        }
    }

    contentItem: Text {
        text: control.text
        font: control.font
        opacity: enabled ? 1.0 : 0.3
        color: control.down ? "#646464" : "#323232"
        verticalAlignment: Text.AlignVCenter
        leftPadding: control.indicator.width + control.spacing
    }
}

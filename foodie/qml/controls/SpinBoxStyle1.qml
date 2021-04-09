import QtQuick 2.12
import QtQuick.Controls 2.12
import AppUtil 1.0

SpinBox {
    id: control
    font.pixelSize: 14
    font.family: AppUtil.font1.name

    background: Rectangle{

    }

    contentItem: TextInput {
        z: 2
        text: control.textFromValue(control.value, control.locale)

        font: control.font
        horizontalAlignment: Qt.AlignHCenter
        verticalAlignment: Qt.AlignVCenter
        selectionColor: "#fddd5c"
        selectedTextColor: "#353637"
        readOnly: !control.editable
        validator: control.validator
        inputMethodHints: Qt.ImhFormattedNumbersOnly
    }

    down.indicator: IconButton{
        size: 30
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        icon.source: "qrc:/assets/images/icons/minus_grey.png"
        icon.color: AppUtil.themeColor
        onClicked: {
            decrease();
            decreased();
        }
    }

    up.indicator: IconButton{
        size: 30
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        icon.source: "qrc:/assets/images/icons/plus_grey.png"
        icon.color: AppUtil.themeColor
        onClicked: {
            increase();
            increased();
        }
    }

    signal increased()
    signal decreased()

}

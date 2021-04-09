import QtQuick 2.12
import QtGraphicalEffects 1.0

Image{
    id: image
    smooth: true

    property color color: "transparent"

    layer.enabled: true
    layer.effect: ColorOverlay{
        color: image.color
    }
}

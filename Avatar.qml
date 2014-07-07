import QtQuick 2.3
import QtGraphicalEffects 1.0

Rectangle {
    property bool active: false
    property alias avatarImage: avatar_image.source

    height: width
    color: main_window.lightBlue
    radius: 0.5*width
    border.width: active?0.02*width:0
    border.color: "white"
    clip: true
    Rectangle {
        id: inner_circle
        anchors.centerIn: parent
        width: 0.8*parent.width
        height: width
        color: "transparent"
        Image {
            id: avatar_image            
            visible: false
            anchors.fill: parent
            fillMode: Image.PreserveAspectCrop
            mipmap: true // better downscaling quality, but may affect performance
        }
        Image {
            id: mask
            source: "img/circular-mask-for-avatar.svg"
            sourceSize: Qt.size(parent.width, parent.height)
            visible: false
        }

        OpacityMask {
            anchors.fill: avatar_image
            source: avatar_image
            maskSource: mask
        }
    }
}

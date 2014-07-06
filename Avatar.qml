import QtQuick 2.0

Rectangle {
    property bool active: false
    property alias avatarImage: avatar_image.source

    height: width
    color: main_window.lightBlue
    radius: 0.1*width
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
            anchors.fill: parent
            fillMode: Image.Stretch
        }
    }
}

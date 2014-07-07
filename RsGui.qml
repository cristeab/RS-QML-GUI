import QtQuick 2.3
import QtQuick.Controls 1.1
import QtQuick.Window 2.0

ApplicationWindow {
    id: main_window

    title: qsTr("RetroShare")

    property color lightBlue:"#5eb9e5"
    property color darkBlue: "#2f5d73"
    property color friendsBlue: "#007f7f"
    property color biologyRed: "#7f0000"
    property color workGrey: "#7f3300"
    property color unGreen: "#007f00"

    //TODO: provide window size in a device independent manner
    width: 0.6*Screen.width
    height: 0.7*Screen.height

    menuBar: MenuBar {
        Menu {
            title: qsTr("File")
            MenuItem {
                text: qsTr("Exit")
                onTriggered: Qt.quit();
            }
        }
        Menu {
            title: qsTr("Options")
        }
        Menu {
            title: qsTr("About")
        }
        Menu {
            title: qsTr("Help")
        }
    }

    Rectangle {
        id: background
        anchors.fill: parent
        color: "black"
        Image {
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            source: "img/big-retroshare-symbol-inverted.svg"
            fillMode: Image.PreserveAspectFit
            width: parent.width/2.5
            height: width
        }
    }
    Status {
        id: column0
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        width: parent.width/3
    }
    Rectangle {
        id: vertical_sep0
        anchors.left: column0.right
        anchors.top: parent.top
        anchors.topMargin: 0.1*column0.width
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0.1*column0.width
        width: 1
        color: "grey"
    }
    FriendsList {
        id: column1
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: vertical_sep0.left
        width: parent.width/3
    }
    Rectangle {
        id: vertical_sep1
        anchors.left: column1.right
        anchors.top: parent.top
        anchors.topMargin: 0.1*column0.width
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0.1*column0.width
        width: 1
        color: "grey"
    }
    Activities {
        id: column2
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: vertical_sep1.left
        width: parent.width/3
    }
}

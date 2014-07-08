import QtQuick 2.3
import QtQuick.Controls 1.2

Item {
    id: talk_tab_frame

    property real commonMargin: 0.05*width

    //TODO: this model should be implemented in C++ and exposed in QML
    ListModel {
        id: messages_model
        ListElement {
            userAvatar: "img/CharlesDarwin.jpg"
            userName: "Charles Darwin"
            userMessage: "Dude, dude, dude!"
            messageTime: "18:04:23"
        }
        ListElement {
            userAvatar: "img/CarlLinnaeus.jpg"
            userName: "Carolus Linaeus"
            userMessage: "Uhm, yeah. Hi Charles."
            messageTime: "18:05:02"
        }
        ListElement {
            userAvatar: "img/CharlesDarwin.jpg"
            userName: "Charles Darwin"
            userMessage: "Duuuuude, yo!"
            messageTime: "18:05:57"
        }
    }
    ListView {
        id: friends
        anchors.top: parent.top
        anchors.topMargin: 0.015*talk_tab_frame.height
        anchors.left: parent.left
        anchors.right: parent.right
        height: 0.8*talk_tab_frame.height
        snapMode: ListView.SnapOneItem
        model: messages_model
        spacing: 0.01*talk_tab_frame.height
        clip: true
        delegate: Item {
            id: delegate_frame
            width: talk_tab_frame.width
            height: 0.07*talk_tab_frame.height
            Avatar {
                id: user_avatar
                anchors.top: parent.top
                anchors.left: parent.left
                width: 0.9*parent.height
                avatarImage: messages_model.get(index).userAvatar
            }
            Text {
                id: user_name
                anchors.left: user_avatar.right
                anchors.leftMargin: 0.02*parent.width
                anchors.right: parent.right
                anchors.bottom: user_avatar.verticalCenter
                text: messages_model.get(index).userName
                color: "lightGrey"
                font.pixelSize: 0.45*parent.height
                elide: Text.ElideRight
            }
            Text {
                anchors.top: user_avatar.verticalCenter
                anchors.left: user_name.left
                anchors.right: user_name.right
                text: messages_model.get(index).userMessage
                color: "white"
                font.pixelSize: 0.48*parent.height
                font.bold: true
                elide: Text.ElideRight
            }
        }
        Component.onCompleted: {
            friends.positionViewAtEnd()
        }
    }
    Rectangle {
        id: chat_frame
        anchors.top: friends.bottom
        anchors.topMargin: talk_tab_frame.commonMargin/2
        anchors.left: friends.left
        anchors.right: friends.right
        height: 0.2*parent.height
        color: main_window.darkBlue
        radius: 3
        opacity: 0.95
        Image {
            anchors.right: parent.right
            anchors.rightMargin:0.05*parent.height
            anchors.bottom: parent.bottom
            anchors.bottomMargin:0.05*parent.height
            source: "img/TabIcon0.svg"
            fillMode: Image.PreserveAspectFit
            smooth: true
            height: parent.height/4.5
            width: height
        }
        TextArea {
            anchors.fill: parent
            text: "New Message..."
            textColor: "white"
            backgroundVisible: false
            font.pixelSize: 0.15*parent.height
        }
    }
}

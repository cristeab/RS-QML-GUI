import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2

Item {
    id: friends_frame

    property real commonMargin: 0.05*width

    Rectangle {
        id: search_frame
        anchors.top: parent.top
        anchors.topMargin: 0.08*parent.height
        anchors.left: parent.left
        anchors.leftMargin: friends_frame.commonMargin
        anchors.right: parent.right
        anchors.rightMargin: friends_frame.commonMargin
        height: 0.04*parent.height
        color: main_window.darkBlue
        radius: 3
        Image {
            id: search_icon
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            anchors.margins: 0.1*parent.height
            width: 0.65*parent.height
            height: width
            source: "img/icon-search.svg"
            fillMode: Image.PreserveAspectFit
            smooth: true
        }
        TextField {
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            anchors.right: search_icon.left
            placeholderText: "Search ..."
            textColor: "white"
            font.pixelSize: 0.04*parent.width
            style: TextFieldStyle {
                background: Rectangle {
                    color: "transparent"
                }
                placeholderTextColor: "white"
            }
            onTextChanged: {
                console.log("TODO: search using pattern "+text)
            }
        }
    }
    Text {
        id: friends_label
        anchors.top: search_frame.bottom
        anchors.topMargin: 0.12*parent.height
        anchors.left: search_frame.left
        anchors.right: search_frame.right
        font.pixelSize: 0.045*parent.width
        text: qsTr("Friends")
        color: "white"
    }

    //TODO: this model should be implemented in C++ and exposed in QML
    ListModel {
        id: friends_model
        ListElement {
            userAvatar: "img/CharlesDarwin.jpg"
            userName: "Charles Darwin"
            userStatus: "Finches, yo!"
            /*groups: [
                ListElement {name: "Friends"; background: main_window.friendsBlue},
                ListElement {name: "Biology Freaks"; background: main_window.biologyRed}
            ]*/
        }
        ListElement {
            userAvatar: "img/DagHammarskjold.jpg"
            userName: "Dag Hammarskjold"
            userStatus: "I never discuss discussions"
            /*groups: [
                ListElement {name: "Friends"; background: main_window.friendsBlue},
                ListElement {name: "Work"; background: main_window.workGrey},
                ListElement {name: "UN"; background: main_window.unGreen}
            ]*/
        }
        ListElement {
            userAvatar: "img/BanKiMoon.jpg"
            userName: "Ban Ki-Moon"
            userStatus: "Lots of work to do"
            /*groups: [
                ListElement {name: "Work"; background: main_window.workGrey},
                ListElement {name: "UN"; background: main_window.unGreen}
            ]*/
        }
    }
    ListView {
        id: friends
        anchors.top: friends_label.bottom
        anchors.topMargin: 0.015*friends_frame.height
        anchors.left: friends_label.left
        anchors.right: friends_label.right
        height: 0.2*friends_frame.height
        snapMode: ListView.SnapOneItem
        model: friends_model
        spacing: 0.01*friends_frame.height
        clip: true
        delegate: Item {
            id: delegate_frame
            width: friends_label.width
            height: 0.045*friends_frame.height
            Avatar {
                id: user_avatar
                anchors.top: parent.top
                anchors.left: parent.left
                width: 0.9*parent.height
                avatarImage: friends_model.get(index).userAvatar
            }
            Text {
                id: user_name
                anchors.left: user_avatar.right
                anchors.leftMargin: 0.02*parent.width
                anchors.right: parent.right
                anchors.bottom: user_avatar.verticalCenter
                text: friends_model.get(index).userName
                color: "white"
                font.pixelSize: 0.45*parent.height
                elide: Text.ElideRight
            }
            Text {
                anchors.top: user_avatar.verticalCenter
                anchors.left: user_name.left
                anchors.right: user_name.right
                text: friends_model.get(index).userStatus
                color: "white"
                font.pixelSize: 0.35*parent.height
                font.italic: true
                elide: Text.ElideRight
            }
        }
    }

    Text {
        id: chats_label
        anchors.top: friends.bottom
        anchors.topMargin: 0.01*parent.height
        anchors.left: friends.left
        anchors.right: friends.right
        font.pixelSize: 0.045*parent.width
        text: qsTr("Chats")
        color: "white"
    }

    //TODO: this model should be implemented in C++ and exposed in QML
    ListModel {
        id: chats_model
        ListElement {
            chatName: "RetroShare Design"
            chatTopic: "Let's work on RS design"
            active: true
        }
        ListElement {
            chatName: "Chatserver EN"
            chatTopic: "Welcome!"
            active: false
        }
    }
    ListView {
        id: chats
        anchors.top: chats_label.bottom
        anchors.topMargin: 0.015*friends_frame.height
        anchors.left: parent.left
        anchors.right: chats_label.right
        height: 0.35*friends_frame.height
        snapMode: ListView.SnapOneItem
        model: chats_model
        spacing: 0.01*friends_frame.height
        clip: true
        delegate: Item {
            id: chat_delegate_frame
            width: chats_label.width
            height: 0.045*friends_frame.height
            Image {
                id: forward_icon
                anchors.left: parent.left
                anchors.leftMargin: 0.02*parent.width
                anchors.verticalCenter: chat_avatar.verticalCenter
                width: friends.commonMargin
                source: "img/icon-forward.svg"
                fillMode: Image.PreserveAspectFit
                smooth: true
                visible: chats_model.get(index).active
            }
            Avatar {
                id: chat_avatar
                anchors.top: parent.top
                anchors.left: forward_icon.right
                anchors.leftMargin: 0.02*parent.width
                width: 0.9*parent.height
                active: forward_icon.visible
            }
            Text {
                id: chat_name
                anchors.left: chat_avatar.right
                anchors.leftMargin: 0.02*parent.width
                anchors.right: parent.right
                anchors.bottom: chat_avatar.verticalCenter
                text: chats_model.get(index).chatName
                color: "white"
                font.pixelSize: 0.45*parent.height
                elide: Text.ElideRight
            }
            Text {
                anchors.top: chat_avatar.verticalCenter
                anchors.left: chat_name.left
                anchors.right: chat_name.right
                text: chats_model.get(index).chatTopic
                color: "white"
                font.pixelSize: 0.35*parent.height
                font.italic: true
                elide: Text.ElideRight
            }
        }
    }

    Image {
        id: graph_view_icon
        anchors.top: chats.bottom
        anchors.left: chats_label.left
        source: "img/retroshare-symbol.svg"
        fillMode: Image.PreserveAspectFit
        smooth: true
        width: 0.1*parent.width
    }
    Text {
        id: graph_view_text
        anchors.top: graph_view_icon.top
        anchors.left: graph_view_icon.right
        anchors.leftMargin: 0.01*parent.width
        text: qsTr("Graph View")
        color: main_window.lightBlue
        font.pixelSize: 0.04*parent.width
        MouseArea {
            anchors.fill: parent
            onClicked: {
                console.log("TODO: show graph")
            }
            onPressed: {
                //TODO: change cursor shape
                graph_view_text.color = Qt.lighter(main_window.lightBlue)
            }
            onReleased: {
                graph_view_text.color = main_window.lightBlue
            }
        }
    }
}

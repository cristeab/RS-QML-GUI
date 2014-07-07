import QtQuick 2.3
import QtQuick.Controls 1.2

Item {
    id: status_frame

    property real commonMargin: 0.1*width

    Avatar {
        id: user_avatar

        anchors.top: parent.top
        anchors.left: parent.left
        anchors.leftMargin: status_frame.commonMargin
        anchors.topMargin: status_frame.commonMargin
        width: 0.25*parent.width
        avatarImage: "img/CarlLinnaeus.jpg"
        active: true
    }
    Text {
        id: user_name
        anchors.left: user_avatar.right
        anchors.leftMargin: 0.05*parent.width
        anchors.right:parent.right
        anchors.bottom: user_avatar.verticalCenter
        text: "Carolus Linaeus"
        color: "white"
        font.pixelSize: 0.05*parent.width
        elide: Text.ElideRight
    }
    Text {
        id: user_status
        anchors.left: user_name.left
        anchors.right: user_name.right
        anchors.top: user_avatar.verticalCenter
        text: "My supercool status goes here"
        color: "white"
        font.pixelSize: 0.035*parent.width
        font.italic: true
        elide: Text.ElideRight
    }

    //TODO: this model should be implemented in C++ and exposed in QML
    ListModel {
        id: downloads_model
        ListElement {
            title: "Incoming: Holiday Pictures May 2013.7z"
            size: "51.02 MB/102.04 MB"
            percent: 50.0
            source: "one source"
            remaining: "10m03s"
            icon: "img/icon-incoming.svg"
        }
        ListElement {
            title: "Outcoming: What I have to deal with.jpg"
            size: "212.84 KB/283.79 KB"
            percent: 75.0
            source: "toCharlesDarwin"
            remaining: "10m03s"
            icon: "img/icon-outgoing.svg"
        }
    }

    ListView {
        id: downloads
        anchors.top: user_avatar.bottom
        anchors.topMargin: 0.075*parent.height
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.leftMargin: status_frame.commonMargin/2.0
        anchors.right: parent.right
        anchors.rightMargin: status_frame.commonMargin/2.0
        snapMode: ListView.SnapOneItem
        model: downloads_model
        clip: true
        delegate: Item {
            id: delegate_frame
            property real commonPixelSize: 0.04*parent.width
            property real commonMargin: 0.03*parent.width
            width: downloads.width
            height: elem_image.height+0.02*status_frame.height+elem_progress_bar.height
            Image {
                id: elem_image
                source: downloads_model.get(index).icon
            }
            Text {
                id: elem_title
                anchors.left: elem_image.right
                anchors.leftMargin: delegate_frame.commonMargin
                anchors.right: parent.right
                text: downloads_model.get(index).title
                anchors.bottom: elem_image.verticalCenter
                color: "white"
                font.pixelSize: delegate_frame.commonPixelSize
                elide: Text.ElideRight
            }
            Text {
                id: elem_subtitle
                property real commonPixelSize: 0.8*delegate_frame.commonPixelSize
                anchors.left: elem_title.left
                anchors.right: elem_title.right
                anchors.top: elem_image.verticalCenter
                clip: true
                text: downloads_model.get(index).size+"; "+downloads_model.get(index).percent+" %; "+downloads_model.get(index).source+"; "+downloads_model.get(index).remaining+" remaining"
                color: "white"
                font.pixelSize: elem_subtitle.commonPixelSize
                elide: Text.ElideRight
            }
            ProgressBar {
                id: elem_progress_bar
                anchors.top: elem_image.bottom
                anchors.topMargin: 0.005*status_frame.height
                anchors.left: elem_image.left
                anchors.right: parent.right
                height: 0.015*status_frame.height
                maximumValue: 100.0
                minimumValue: 0.0
                value: downloads_model.get(index).percent
            }
        }
    }
}

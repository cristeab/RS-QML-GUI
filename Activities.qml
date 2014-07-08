import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import QtGraphicalEffects 1.0

Item {
    id: activities_frame

    property real commonMargin: 0.1*width

    Avatar {
        id: current_user_avatar

        anchors.top: parent.top
        anchors.left: parent.left
        anchors.leftMargin: activities_frame.commonMargin
        anchors.topMargin: activities_frame.commonMargin
        width: 0.25*parent.width
        avatarImage: "img/CharlesDarwin.jpg"
        active: true
    }
    Text {
        id: current_user_name
        anchors.left: current_user_avatar.right
        anchors.leftMargin: 0.05*parent.width
        anchors.right:parent.right
        anchors.bottom: current_user_avatar.verticalCenter
        text: "Charles Darwin"
        color: "white"
        font.pixelSize: 0.05*parent.width
        elide: Text.ElideRight
    }
    Text {
        id: current_user_status
        anchors.left: current_user_name.left
        anchors.right: current_user_name.right
        anchors.top: current_user_avatar.verticalCenter
        text: "Finches, yo!"
        color: "white"
        font.pixelSize: 0.035*parent.width
        font.italic: true
        elide: Text.ElideRight
    }

    Component {
      id: tabViewStyle
      TabViewStyle {
        tabsAlignment: Qt.AlignLeft
        tabOverlap: 0
        tabsMovable: false
        tab: Rectangle {
          implicitWidth: control.width/control.count
          implicitHeight: 0.1*activities_frame.height
          color: "black"
          Image {
            id: tab_image
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            fillMode: Image.PreserveAspectFit
            width: parent.width/4
            height: width
            smooth: true
            source: "img/TabIcon"+styleData.index+".svg"
          }
          Text {
              function tabText(index) {
                if (0 === index) {
                    return qsTr("Task")
                } else if (1 === index) {
                    return qsTr("Share")
                } else {
                    return qsTr("Settings")
                }
              }
              anchors.left: tab_image.right
              anchors.leftMargin: 0.1*parent.width
              anchors.right: parent.right
              anchors.bottom: tab_image.verticalCenter
              text: tabText(styleData.index)
              color: styleData.selected?"white":main_window.lightBlue
              font.pixelSize:0.15*parent.width
          }
          ColorOverlay {
              anchors.fill: tab_image
              source: tab_image
              color: styleData.selected?"#FFFFFF":"#5eb9e5"
          }
        }
        frame: Rectangle {
            color: "transparent"
        }
      }
    }
    TabView {
        anchors.top: current_user_avatar.bottom
        anchors.topMargin: activities_frame.commonMargin
        anchors.left: parent.left
        anchors.leftMargin: activities_frame.commonMargin/2
        anchors.right: parent.right
        anchors.rightMargin: activities_frame.commonMargin/2
        height: 0.7*parent.height
        style: tabViewStyle
        opacity: 1
        Tab {
            TalkTab {
            }
        }
        Tab {
            ShareTab {
            }
        }
        Tab {
            SettingsTab {
            }
        }
    }
}

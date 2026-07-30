import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland

RowLayout {
    id: root
    Layout.alignment: Qt.AlignVCenter

    required property int offset
    required property int workspaceNum
    required property int itemWidth
    required property int itemHeight

    Repeater {
        model: workspaceNum

        Item {
            required property int index
            property int num: root.offset + index + 1
            property int displayNum: index + 1

            property bool isActive: {
                if (!Hyprland.focusedWorkspace) return false;
                return (Hyprland.focusedWorkspace.id) === num;
            }

            width: root.itemWidth
            height: root.itemHeight

            Layout.alignment: Qt.AlignVCenter

            Text {
                anchors.centerIn: parent
                text: displayNum.toString()
                font.family: "Iosevka Nerd Font Mono"
                font.pixelSize: 16
                font.weight: isActive ? Font.Bold : Font.Thin
                color: isActive ? '#31aacc' : '#d8dee9'
            }

            Rectangle {
                anchors.centerIn: parent
                width: isActive ? parent.height : 0
                height: parent.height
                color: '#0ce8e8e8'
            }

            Rectangle {
                anchors.bottom: parent.bottom
                width: isActive ? parent.height : 0
                height: 3
                color: '#31aacc'
            }

            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: {
                    Hyprland.dispatch(`hl.dsp.focus({workspace = ${num}})`)
                }
            }
        }
    }
}

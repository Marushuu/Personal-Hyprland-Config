import QtQuick
import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland

Scope {
    id: root
    Variants {
        model: Quickshell.screens
        PanelWindow {
            id: panel
            required property var modelData
            screen: modelData

            property int offset: {
                if (modelData.name === "DP-1") return 0;
                if (modelData.name === "DP-4") return 5;
                return 0;
            }

            anchors {
                top: true
                left: true
                right: true
            }

            implicitHeight: 32
            color: '#0f0f0f'

            Row {
                id: workspacesRow

                anchors.left: parent

                spacing: 12

                Repeater {
                    model: 5

                    Item {
                        required property int index
                        property int num: panel.offset + index + 1
                        property int displayNum: index + 1

                        property bool isActive: {
                            if (!Hyprland.focusedWorkspace) return false;
                            return (Hyprland.focusedWorkspace.id) === num;
                        }

                        width: 12
                        height: 32

                        Text {
                            anchors.centerIn: parent
                            text: displayNum.toString()
                            font.pixelSize: 14
                            font.weight: isActive ? Font.Bold : Font.Normal
                            color: isActive ? '#ff0015' : '#d3d3d3'
                        }

                        Rectangle {
                            anchors.bottom: parent.bottom
                            anchors.bottomMargin: 2
                            anchors.horizontalCenter: parent.horizontalCenter
                            width: isActive ? 16 : 0
                            height: 2
                            color: "#ff0015"

                            Behavior on width {
                                NumberAnimation {
                                    duration: 120;
                                    easing.type: Easing.OutCubic
                                }
                            }
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
        }
    }
}

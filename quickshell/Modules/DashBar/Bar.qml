import QtQuick
import Quickshell
import "./Components"
import "../../Services"

Scope {
    id: root
    Variants {
        model: Quickshell.screens
        PanelWindow {
            id: dashBar
            required property var modelData
            screen: modelData

            readonly property bool primaryScreen: modelData.name === "DP-1"

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

            implicitHeight: 36
            color: '#e6232324'

            Rectangle {
                anchors.bottom: parent.bottom
                width: parent.width
                height: 2
                color: '#2c496b'
            }

            // Left Row
            Row {
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter

                spacing: 16
                
                height: parent.height

                Workspaces {
                    offset: dashBar.offset
                    workspaceNum: 5
                }

                WindowTitle {
                    itemWidth: modelData.width / 10
                }
            }

            // Center Row

            MediaTracker {
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter

                visible: primaryScreen
            }

            // Right Row
            Row {
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                anchors.rightMargin: 16

                spacing: 16

                height: parent.height
                Tray {
                    panelWindow: dashBar
                }
                Network {
                    textColor: "#d8dee9"
                }
                Clock {
                    textColor: "#d8dee9"
                    dimColor: "#31aacc"
                    fontSize: 16
                }
                Text {
                    text: ""
                    font.pixelSize: 12
                    color: "#d8dee9"

                    anchors.verticalCenter: parent.verticalCenter
                }
            }
        }
    }
}

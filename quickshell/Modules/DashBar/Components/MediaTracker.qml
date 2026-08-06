import QtQuick
import Quickshell
import Quickshell.Services.Mpris

import "../../../Services"

Item {
    id: root

    implicitWidth: mainRow.implicitWidth

    // Syncs with Mpris
    property var activePlayer: Mpris.players.values.length > 0 ? Mpris.players.values[0] : null

    Row {
        id: mainRow
        anchors.verticalCenter: parent.verticalCenter
        spacing: 16

        // Cava Visualizer
        Row {
            spacing: 4

            Repeater {
                model: 6

                Rectangle {
                    required property int index
                    
                    // Pull live CAVA level if player is playing, otherwise zero out
                    property bool isPlaying: root.activePlayer ? root.activePlayer.isPlaying : false
                    property int rawVal: isPlaying ? (CavaService.values[index] || 0) : 0
                    
                    width: 3
                    height: Math.max(3, Math.min(16, Math.floor((rawVal / 100) * 16)))
                    color: root.activePlayer && root.activePlayer.isPlaying ? "#31aacc" : '#d8dee9'
                    radius: 1

                    Behavior on height {
                        NumberAnimation { duration: 50; easing.type: Easing.OutCubic }
                    }
                }
            }
        }

        // Marquee Text
        Item {
            id: textClipBox
            width: 160
            height: 20
            clip: true

            // Text dynamically updates whenever activePlayer changes
            property string fullText: {
                if (!root.activePlayer) return "No Media";
                
                var title = root.activePlayer.trackTitle || "Unknown Track";
                var artist = root.activePlayer.trackArtist || "";
                
                return artist ? `${title} • ${artist}` : title;
            }

            Text {
                id: songText
                
                anchors.horizontalCenter: {
                    if (textClipBox.fullText === "No Media")
                        return parent.horizontalCenter
                    if (songText.implicitWidth < textClipBox.width)
                        return parent.horizontalCenter
                }

                text: textClipBox.fullText
                font.family: "Iosevka Nerd Font Mono"
                font.pixelSize: 16
                color: "#d8dee9"
                x: 0

                property real overflowDistance: Math.max(0, songText.implicitWidth - textClipBox.width)

                // Restart marquee animation when track title changes
                onTextChanged: {
                    x = 0;
                }

                SequentialAnimation on x {
                    running: songText.overflowDistance > 0
                    loops: Animation.Infinite

                    PauseAnimation { duration: 5000 }
                    
                    NumberAnimation {
                        to: -songText.overflowDistance
                        duration: Math.max(2500, songText.overflowDistance * 30)
                        easing.type: Easing.InOutQuad
                    }

                    PauseAnimation { duration: 5000 }

                    NumberAnimation {
                        to: 0
                        duration: Math.max(2500, songText.overflowDistance * 30)
                        easing.type: Easing.InOutQuad
                    }
                }
            }
        }

        // Inline Controls
        Row {
            spacing: 8

            // Previous
            Text {
                text: "󰒮"
                font.pixelSize: 16
                color: "#d8dee9"

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        if (root.activePlayer) root.activePlayer.previous()
                    }
                }
            }

            // Play / Pause Circle
                Text {
                    text: root.activePlayer && root.activePlayer.isPlaying ? "" : ""
                    font.pixelSize: 16
                    color: root.activePlayer && root.activePlayer.isPlaying ? "#31aacc": "#d8dee9"

                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                            if (root.activePlayer) {
                                root.activePlayer.isPlaying = !root.activePlayer.isPlaying
                            }
                        }
                    }
                } 

            // Next
            Text {
                text: "󰒭"
                font.pixelSize: 16
                color: "#d8dee9"

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        if (root.activePlayer) root.activePlayer.next()
                    }
                }
            }
        }
    }
}
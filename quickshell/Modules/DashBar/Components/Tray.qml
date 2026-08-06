import QtQuick
import QtQuick.Effects
import Quickshell
import Quickshell.Services.SystemTray

Row {
    id: root
    spacing: 8

    required property PanelWindow panelWindow

    anchors.verticalCenter: parent.verticalCenter

    Repeater {
        model: SystemTray.items.values

        Item {
            id: trayWrapper
            required property var modelData
            
            width: 18
            height: 18

            // Menu anchor anchored to the SPECIFIC icon's bounding box
            QsMenuAnchor {
                id: menuAnchor
                menu: trayWrapper.modelData ? trayWrapper.modelData.menu : null

                anchor {
                    window: root.panelWindow
                }
            }

            // Tray Icon Image
            Image {
                id: sourceImage
                anchors.fill: parent
                source: trayWrapper.modelData.icon
                fillMode: Image.PreserveAspectFit
                smooth: true
                layer.enabled: true
                layer.effect: MultiEffect {
                    source: sourceImage
                    anchors.fill: sourceImage
                    colorization: 1
                    colorizationColor: "#d8dee9"
                }
            }

            // Mouse Click Handling
            MouseArea {
                anchors.fill: parent
                acceptedButtons: Qt.LeftButton | Qt.RightButton
                cursorShape: Qt.PointingHandCursor

                onClicked: mouse => {
                    var item = trayWrapper.modelData;
                    if (!item) return;

                    var pos = trayWrapper.mapToItem(root.panelWindow.contentItem, 0, 18);
                    menuAnchor.anchor.rect = Qt.rect(pos.x, pos.y, trayWrapper.width, trayWrapper.height);

                    if (mouse.button === Qt.RightButton) {
                        if (item.hasMenu && menuAnchor.menu) {
                            menuAnchor.open();
                        } else {
                            item.secondaryActivate(0, 0);
                        }
                    } else if (mouse.button === Qt.LeftButton) {
                        if (item.hasMenu && item.onlyMenu) {
                            menuAnchor.open();
                        } else {
                            item.activate(0, 0);
                        }
                    }
                }
            }
        }
    }
}
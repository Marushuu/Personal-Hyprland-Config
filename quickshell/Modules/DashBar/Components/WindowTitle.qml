import QtQuick
import Quickshell.Hyprland

Item {
    id: root

    required property int itemWidth
    required property int itemHeight

    height: itemHeight
    width: itemWidth

    // Checks Active Window, also checks Special Workspaces
    readonly property bool windowActive: {
        if (!Hyprland.activeToplevel) return false;
        if (Hyprland.activeToplevel.workspace.id < 0) return true;
        return Hyprland.focusedWorkspace && 
            Hyprland.activeToplevel.workspace === Hyprland.focusedWorkspace;
    }

    property string titleString: windowActive ? `// ${Hyprland.activeToplevel.title}` : '// ...'

    Text {
        id: windowTitle

        anchors.verticalCenter: parent.verticalCenter

        text: root.titleString
        font.family: "Iosevka Nerd Font Mono"
        font.pixelSize: 16
        font.weight: Font.Thin
        color: '#d8dee9'

        width: parent.width
        elide: Text.ElideRight
    }
}
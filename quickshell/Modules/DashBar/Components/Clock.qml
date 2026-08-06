import QtQuick
import "../../../Services"

Row {
    id: root
    spacing: 6

    required property color textColor
    required property color dimColor
    required property int fontSize
    
    anchors.verticalCenter: parent.verticalCenter

    // Clock Icon
    Text {
        text: "|"
        font.family: "Iosevka Nerd Font Mono"
        font.pixelSize: fontSize
        color: dimColor
    }

    // Time
    Text {
        text: TimeService.timeStr
        font.family: "Iosevka Nerd Font Mono"
        font.pixelSize: fontSize
        font.bold: true
        color: textColor
    }

    // Separator
    Text {
        text: "|"
        font.family: "Iosevka Nerd Font Mono"
        font.pixelSize: fontSize
        color: dimColor
    }

    // Date
    Text {
        text: TimeService.dateStr
        font.family: "Iosevka Nerd Font Mono"
        font.pixelSize: fontSize
        color: textColor
    }
}
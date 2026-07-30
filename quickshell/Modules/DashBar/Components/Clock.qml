import QtQuick
import QtQuick.Layouts
import "../../../Services"

RowLayout {
    id: root
    spacing: 6
    Layout.alignment: Qt.AlignVCenter

    required property color textColor
    required property color dimColor
    required property int timeFontSize
    required property int dateFontSize
    required property int itemHeight

    height: itemHeight

    // Clock Icon
    Text {
        text: "󰥔"
        font.family: "Iosevka Nerd Font Mono"
        font.pixelSize: timeFontSize
        color: dimColor

        Layout.alignment: Qt.AlignVCenter
    }

    // Time
    Text {
        text: TimeService.timeStr
        font.family: "Iosevka Nerd Font Mono"
        font.pixelSize: timeFontSize
        font.bold: true
        color: textColor

        Layout.alignment: Qt.AlignVCenter
    }

    // Separator
    Text {
        text: "|"
        font.family: "Iosevka Nerd Font Mono"
        font.pixelSize: dateFontSize
        color: dimColor

        Layout.alignment: Qt.AlignVCenter
    }

    // Date
    Text {
        text: TimeService.dateStr
        font.family: "Iosevka Nerd Font Mono"
        font.pixelSize: dateFontSize
        color: dimColor

        Layout.alignment: Qt.AlignVCenter
    }
}
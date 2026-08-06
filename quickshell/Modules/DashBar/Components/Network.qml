import QtQuick
import QtQuick.Layouts
import "../../../Services"


Item {
    id: root

    implicitHeight: parent.height
    implicitWidth: row.implicitWidth

    required property color textColor

    anchors.verticalCenter: parent.verticalCenter

    Row {
        id: row
        spacing: 16
        anchors.centerIn: parent

        Text {
            text: "|"
            font.family: "Iosevka Nerd Font Mono"
            font.pixelSize: 16
            color: "#31aacc"
        }

        Text {
            id: networkIcon
            text: {
                if (NetworkService.ethernetSignal) 
                    return (NetworkService.limitedConnection ? "LIMITED" : "ETHERNET" )
                if (NetworkService.wifiSignal > 0)
                    return ("WIFI " + NetworkService.wifiSignal + "%")
                return "OFFLINE"
            }
            font.family: "Iosevka Nerd Font Mono"
            font.pixelSize: 16
            color: "#d8dee9"
        }


        
        // Text {
        //     id: bluetoothIcon
        //     text: "BT" 
        //     font.family: "Iosevka Nerd Font Mono"
        //     font.pixelSize: 16
        //     color: textColor

        //     MouseArea {
        //         anchors.fill: parent
        //         cursorShape: Qt.PointingHandCursor
        //     }
        // }
    }
}
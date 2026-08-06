pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root

    property int wifiSignal: 0
    property bool ethernetSignal: false
    property string connectionStatus: "unknown"

    readonly property bool limitedConnection: {
        return connectionStatus === "limited" 
            || connectionStatus === "portal" 
            || connectionStatus === "none"
    }

    // readonly property string netIcon: {
    //     if (ethernetSignal) return limitedConnection ? "󰲛" : ""
    //     if (limitedConnection) return ""

    //     if (wifiSignal <= 0) return limitedConnection ? "󰤫" : "󰤮"
    //     if (wifiSignal > 75) return limitedConnection ? "󰤩" : "󰤨"
    //     if (wifiSignal > 50) return limitedConnection ? "󰤦" : "󰤥"
    //     if (wifiSignal > 25) return limitedConnection ? "󰤣" : "󰤢"
    //     return limitedConnection ? "󰤠" : "󰤟"
    // }

    Process {
        id: wifiPoll
        command: ["bash", "-c", "nmcli -t -f ACTIVE,SIGNAL dev wifi | grep '^yes:' | head -1 | cut -d: -f2"]
        stdout: SplitParser {
            onRead: data => {
                var signal = parseInt(data.trim());
                wifiSignal = isNaN(signal) ? 0 : signal
            }
        }
    }

    Process {
        id: ethPoll
        command: ["bash", "-c", "nmcli -t -f TYPE,STATE dev | grep -c 'ethernet:connected'"]
        stdout: SplitParser {
            onRead: data => {
                ethernetSignal = parseInt(data.trim()) > 0;
            }
        }
    }

    Process {
        id: connPoll
        command: ["bash", "-c", "nmcli -t -f CONNECTIVITY general | head -1"]
        stdout: SplitParser {
            onRead: data => {
                var status = data.trim().toLowerCase();
                if (status !== "") connectionStatus = status
            }
        }
    }

    Timer {
        interval: 3500
        running: true
        repeat: true
        triggeredOnStart: true
        onTriggered: {
            wifiPoll.running = true;
            ethPoll.running = true;
            connPoll.running = true;
        }
    }
}
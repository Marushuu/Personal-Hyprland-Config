pragma Singleton

import QtQuick
import Quickshell

Singleton {
    id: root

    // Central Date object updated every second
    property var currentTime: new Date()

    property string timeStr: currentTime.toLocaleTimeString(Qt.locale(), "h:mm A")
    property string dateStr: currentTime.toLocaleDateString(Qt.locale(), "ddd, MMM d")
    property string isoStr: currentTime.toISOString()

    // Central timer ticking once per second
    property Timer _timer: Timer {
        interval: 1000
        running: true
        repeat: true
        triggeredOnStart: true
        onTriggered: {
            root.currentTime = new Date();
        }
    }
}
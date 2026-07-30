pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root

    // Reactive array holding 6 bar levels (0-100 scale)
    property var values: [0, 0, 0, 0, 0, 0]

    // Service process using CAVA in raw output mode
    property Process cavaProc: Process {
        // Creates a CAVA config stream outputting values 0-100 separated by ';'
        command: [
            "sh", "-c",
            "cava -p /dev/stdin << 'EOF'\n" +
            "[general]\n" +
            "bars = 6\n" +
            "framerate = 60\n" +
            "[output]\n" +
            "method = raw\n" +
            "raw_target = /dev/stdout\n" +
            "data_format = ascii\n" +
            "ascii_max_range = 100\n" +
            "bar_delimiter = 59\n" + // ';' ASCII code
            "EOF"
        ]
        running: true

        stdout: SplitParser {
            onRead: data => {
                var raw = data.trim().split(";").map(v => parseInt(v) || 0);
                if (raw.length >= 6) {
                    root.values = raw.slice(0, 6);
                }
            }
        }
    }
}
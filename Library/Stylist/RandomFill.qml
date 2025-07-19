import QtQuick
import QtQuick.Controls 2.15
import QtQuick.Layouts
import QtQuick 2.15
Rectangle{ id : rect
    color: Qt.rgba( Math.random() * 0.3,
                   // R: 0–0.3
                   Math.random() * 0.3,
                   // G: 0–0.3
                   Math.random() * 0.3,
                   // B: 0–0.3 1
                   // Opacity
                   )
    radius: 4
    anchors.fill: parent
}

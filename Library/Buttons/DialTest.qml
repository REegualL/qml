import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts
import "../Stylist"

Dial {
    id: root

    startAngle: 0
    endAngle: 360

    property bool isActive
    property color activeColor: Color.wildBlueYonder
    property color inactiveColor: Color.vampireBlack

    signal clicked

    enabled: root.isActive
    palette.dark: root.pressed ? root.activeColor : root.inactiveColor

    implicitHeight: heightSize
    implicitWidth: widthSize

    property int widthToOccupe: 0
    property int heightToOccupe: 0

    background: Rectangle {
        id: bg
        implicitWidth: 140
        implicitHeight: 140
        width: Math.max(64, Math.min(root.width, root.height))
        height: width
        x: root.width / 2 - width / 2
        y: root.height / 2 - height / 2
        color: Color.vampireBlack
        radius: width / 2
        border.width: root.value * 100  // Border grows as value increases
        border.color: root.activeColor
        opacity: root.enabled ? 1 : 0.3
    }

    contentItem: Item {
        anchors.fill: parent

        Text {
            id: valueText
            text: root.value.toFixed(2)
            color: Qt.rgba(
                0.5 + root.value * 0.5,  // R: 0.7–1.0
                0.5 + root.value * 0.5,  // G: 0.7–1.0
                0.5 + root.value * 0.5,  // B: 0.7–1.0
                1
            )
            font.bold: true
            font.pointSize: root.pressed ? 24 : 17
            anchors.centerIn: parent
        }
    }

    handle: Rectangle {
        id: handleItem
        width: 16
        height: 16
        radius: 8
        antialiasing: true
        color: root.pressed ? root.inactiveColor : root.activeColor
        opacity: root.enabled ? 1 : 0.3

        x: bg.x + bg.width / 2 - width / 2
        y: bg.y + bg.height / 2 - height / 2

        transform: [
            Translate { y: -Math.min(bg.width, bg.height) * 0.5 },
            Rotation {
                angle: root.angle
                origin.x: handleItem.width / 2
                origin.y: handleItem.height / 2
            }
        ]
    }

    onClicked: root.clicked()
}

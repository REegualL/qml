import ".."
import QtQuick 2.15
import QtQuick.Effects

Item {
    id: root

    property alias icon: iconElement.source
    property alias content: contentArea.children
    property alias border: roburIcon.border.width

    property bool isSetPreferredWidth: false
    property bool writable: false

    property color activeColor: Qt.rgba(
        0.2 + Math.random() * 0.3,  // R: 0.7–1.0
        0.2 + Math.random() * 0.3,  // G: 0.7–1.0
        0.2 + Math.random() * 0.3,  // B: 0.7–1.0
        1
    )
    property color inactiveColor: Qt.rgba(
        0.2 + Math.random() * 0.3,  // R: 0.7–1.0
        0.2 + Math.random() * 0.3,  // G: 0.7–1.0
        0.2 + Math.random() * 0.3,  // B: 0.7–1.0
        1
    )

    property int customRadius: roburIcon.height / 2
    property color color: root.activeColor
    property bool filled: false
    property bool isrotated: false
    property real imgRateo: 0.5
    property color imageColor: filled
        ? Qt.rgba(1.0, 1.0, 1.0, 1.0)
        : root.enabled
            ? root.activeColor
            : root.inactiveColor
    property bool isSelected: false

    // multieffect and status buttons:
    property bool isMultiEffectActive: true

    // set the button is clickable
    property bool isEnabled: true
    property bool isPressed: false
    property bool isTick: false
    property bool isButton: false

    property alias mouse: buttonMouseArea

    // signals
    signal clicked()
    signal pressed()
    signal released()
    signal pressAndHold()
    signal tick()
    signal buttonClicked()

    implicitHeight: 50
    implicitWidth: 50

    onFilledChanged: {
        roburIcon.color = root.filled
            ? root.enabled
                ? root.activeColor
                : root.inactiveColor
            : "transparent";
        imageColor = filled
            ? Style.colors.white
            : root.enabled
                ? root.activeColor
                : root.inactiveColor;
    }

    onEnabledChanged: {
        roburIcon.color = root.filled
            ? root.enabled
                ? root.activeColor
                : root.inactiveColor
            : "transparent";
        imageColor = filled
            ? Style.colors.white
            : root.enabled
                ? root.activeColor
                : root.inactiveColor;
    }

    Rectangle {
        id: roburIcon
        anchors.fill: parent
        radius: root.customRadius
        color: root.filled
            ? root.enabled
                ? root.activeColor
                : root.inactiveColor
            : "transparent"
        border.width: 3
        border.color: isButton
            ? (root.isPressed ? root.activeColor : root.inactiveColor)
            : (root.isSelected ? root.activeColor : root.inactiveColor)
        rotation: isrotated ? 180 : 0

        Item {
            anchors.centerIn: parent
            width: height
            height: roburIcon.height * imgRateo

            Image {
                id: iconElement
                source: icon
                sourceSize.height: roburIcon.height * imgRateo
                sourceSize.width: roburIcon.width * imgRateo
                fillMode: Image.PreserveAspectFit
                anchors.centerIn: parent
                mipmap: true
                antialiasing: true
                layer.enabled: true
                visible: false
            }

            MultiEffect {
                id: colorway
                visible: isMultiEffectActive
                source: iconElement
                anchors.fill: iconElement
                brightness: 1.0
                colorization: 1.0
                colorizationColor: isButton
                    ? (root.isPressed ? root.activeColor : root.inactiveColor)
                    : (root.isSelected ? root.activeColor : root.inactiveColor)
            }
        }
    }

    Item {
        id: contentArea
        anchors.centerIn: parent
    }

    MouseArea {
        id: buttonMouseArea
        anchors.fill: parent

        onClicked: {
            if (isEnabled) {
                if (isButton) {
                    root.isPressed = true
                    pressedTimer.start();
                } else {
                    root.clicked();
                }
                root.buttonClicked();
            }
        }

        onPressed: {
            if (isEnabled) {
                root.isPressed = true
                if (filled)
                    root.opacity = 0.8;
                else
                    roburIcon.color = "#20" + root.color.toString().replace("#", "");
                root.pressed();
            }
        }

        onPressAndHold: {
            if (isEnabled) {
                pressedTimer.start();
                tickerTimer.start();
            }
        }

        onReleased: {
            if (isEnabled) {
                if (filled) {
                    root.opacity = 1;
                } else {
                    roburIcon.color = "transparent";
                }
                root.released();
                pressedTimer.stop();
                tickerTimer.stop();
            }
        }
    }

    Timer {
        id: pressedTimer
        interval: 100
        running: false
        repeat: false
        onTriggered: {
            root.isPressed = false
            root.clicked();
        }
    }

    Timer {
        id: tickerTimer
        interval: 100
        running: false
        repeat: true
        onTriggered: {
            tick();
        }
    }
}

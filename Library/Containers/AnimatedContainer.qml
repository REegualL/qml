import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import QtQuick.Effects
import "../Stylist"

Rectangle {
    id: root

    property bool isActive: false
    property bool isZActive: false
    property color activeColor: Color.dirtyWhite
    property color inactiveColor: Color.blackChocolate
    property bool isAnimated: false

    property int widthSize: 100 // TODO add in Stylist file
    property int heightSize: 100

    implicitHeight: root.heightSize
    implicitWidth: root.widthSize

    property int widthToOccupe: 0
    property int heightToOccupe: 0

    signal clicked
    signal disableAll

    color: root.isActive ? activeColor : inactiveColor
    radius: 4

    MouseArea {
        anchors.fill: parent
        onClicked: {
            if (isAnimated) {
                root.isActive = !root.isActive
                root.disableAll()
                root.clicked()
            }
        }
    }

    states: [
        State {
            name: "small"
            when: !root.isActive
        },
        State {
            name: "big"
            when: root.isActive
        }
    ]

    transitions: [
        Transition {
            from: "small"
            to: "big"
            ParallelAnimation {
                id: bigg
                NumberAnimation {
                    target: root
                    property: "implicitWidth"
                    from: widthSize
                    to: widthToOccupe
                }
                NumberAnimation {
                    target: root
                    property: "implicitHeight"
                    from: heightSize
                    to: heightToOccupe
                }
                onStarted: {
                    isZActive = true
                }
            }
        },
        Transition {
            from: "big"
            to: "small"
            ParallelAnimation {
                id: small
                NumberAnimation {
                    target: root
                    property: "implicitWidth"
                    from: widthToOccupe
                    to: widthSize
                }
                NumberAnimation {
                    target: root
                    property: "implicitHeight"
                    from: heightToOccupe
                    to: heightSize
                }
                onFinished: {
                    isZActive = false
                }
            }
        }
    ]
}

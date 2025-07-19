import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Shapes 1.9
import "../Stylist"

Rectangle {
    id: root

    property real duration: 500
    property bool isActive: false
    property string iconPath: ""
    property real imgRateo: 0.5
    property color activeColor: Color.wildBlueYonder
    property color inactiveColor: Color.blackChocolate

    width: 50
    height: 50
    radius: 4
    state: isActive ? StateObject.pressed : StateObject.released

    signal clicked

    // Image {
    //     id: iconElement
    //     // source: root.iconPath
    //     sourceSize.height: root.height * root.imgRateo
    //     sourceSize.width: root.width * root.imgRateo
    //     fillMode: Image.PreserveAspectFit
    //     anchors.centerIn: parent
    //     mipmap: true
    //     antialiasing: true
    //     layer.enabled: true
    //     visible: false
    // }

    MouseArea {
        hoverEnabled: true
        anchors.fill: parent

        // onPressed: root.state = StateObject.pressed
        // onReleased: root.state = StateObject.released
        // onEntered: root.state = StateObject.hovered
        // onExited: root.state = StateObject.released
        // onPositionChanged: root.state = StateObject.hovered

        onClicked: {
            // isActive = !isActive
            root.clicked()
        }
    }

    states: [
        State {
            name: StateObject.pressed
            PropertyChanges { target: root; color: activeColor }
            PropertyChanges { target: root; radius: 100 }
        },
        State {
            name: StateObject.released
            PropertyChanges { target: root; color: inactiveColor }
            PropertyChanges { target: root; radius: 4 }
        },
        State {
            name: StateObject.hovered
            PropertyChanges { target: root; color: "pink" }
            PropertyChanges { target: root; radius: 10 }
        }
    ]

    transitions: [
        Transition {
            from: StateObject.pressed
            to: StateObject.released
            ParallelAnimation {
                ColorAnimation { target: root; property: "color"; duration: root.duration }
                NumberAnimation { target: root; property: "radius"; duration: root.duration }
            }
        },
        Transition {
            from: StateObject.released
            to: StateObject.pressed
            ParallelAnimation {
                ColorAnimation { target: root; property: "color"; duration: root.duration }
                NumberAnimation { target: root; property: "radius"; duration: root.duration }
            }
        },
        Transition {
            from: StateObject.released
            to: StateObject.hovered
            ParallelAnimation {
                ColorAnimation { target: root; property: "color"; duration: root.duration }
                NumberAnimation { target: root; property: "radius"; duration: root.duration }
            }
        },
        Transition {
            from: StateObject.hovered
            to: StateObject.released
            ParallelAnimation {
                ColorAnimation { target: root; property: "color"; duration: root.duration }
                NumberAnimation { target: root; property: "radius"; duration: root.duration }
            }
        },
        Transition {
            from: StateObject.hovered
            to: StateObject.pressed
            ParallelAnimation {
                ColorAnimation { target: root; property: "color"; duration: root.duration }
                NumberAnimation { target: root; property: "radius"; duration: root.duration }
            }
        }

        // Optional Transition:
        // Transition {
        //     from: StateObject.pressed
        //     to: StateObject.hovered
        //     ParallelAnimation {
        //         ColorAnimation { target: root; property: "color"; duration: root.duration }
        //         NumberAnimation { target: root; property: "radius"; duration: root.duration }
        //     }
        // }
    ]
}

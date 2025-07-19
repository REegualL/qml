import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import QtQuick.Effects
import "../Stylist"

Rectangle {
    id: root
    state: isActive ? "active" : "inactive"

    property real candidateValue: 0
    property bool isActive: false
    property bool isZActive: false
    property bool needToFix: true
    property color activeColor: Color.vampireBlack
    property color inactiveColor: Color.dirtyWhite
    property string label
    property bool enableTick: false
    property bool isAnimated: false

    property int widthSize: 220
    property int heightSize: 110

    property int textSize: 32
    property int btnSize: 64

    property bool changeValue: true

    implicitHeight: root.heightSize
    implicitWidth: root.widthSize

    property int smallText: 10
    property int activeText: 15

    property int sizeLabelFont: 10
    property int widthToOccupe: widthSize
    property int heightToOccupe: heightSize

    signal upClicked
    signal downClicked
    signal clicked
    signal disableAll

    radius: 4

    Rectangle {
        id: counterContainer
        anchors.fill: parent
        anchors.margins: 32
        radius: 32
        height: root.textSize * 1.5
        width: root.textSize * 1.5
        antialiasing: true

        Text {
            id: candidate
            text: root.candidateValue
            font.pointSize: root.textSize
            width: parent.width
            height: parent.height / 2
            anchors.centerIn: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

        ColumnLayout {
            id: bottonsContainer
            visible: root.isActive && root.changeValue
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.rightMargin: 8
            anchors.bottom: parent.bottom
            width: 64

            Item {
                Layout.fillHeight: true
                Layout.fillWidth: true
            }

            IconBTN {
                id: upButton
                activeColor: root.isActive ? root.activeColor : "transparent"
                Layout.preferredWidth: root.btnSize
                Layout.preferredHeight: root.btnSize
                Layout.alignment: Qt.AlignCenter
                isSelected: root.isActive
                onClicked: root.upClicked()
                onTick: root.upClicked()
                rotation: 90
            }

            Item {
                Layout.fillHeight: true
                Layout.fillWidth: true
            }

            IconBTN {
                id: downButton
                activeColor: root.isActive ? root.activeColor : "transparent"
                Layout.preferredWidth: root.btnSize
                Layout.preferredHeight: root.btnSize
                Layout.alignment: Qt.AlignVCenter
                isSelected: root.isActive
                rotation: 270
                customRadius: 32
                onClicked: root.downClicked()
                onTick: root.downClicked()
            }

            Item {
                Layout.fillHeight: true
                Layout.fillWidth: true
            }
        }
    }

    Text {
        id: counterLabel
        text: root.label
        font.pointSize: root.smallText
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.margins: 8
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            root.disableAll()
            isActive = !isActive
        }
    }

    states: [
        State {
            name: "inactive"
            when: !isActive
            PropertyChanges { target: root; color: root.inactiveColor }
            PropertyChanges { target: counterContainer; color: root.activeColor }
            PropertyChanges { target: candidate; color: root.inactiveColor }
            PropertyChanges { target: counterLabel; color: root.activeColor }
        },
        State {
            name: "active"
            when: isActive
            PropertyChanges { target: root; color: root.activeColor }
            PropertyChanges { target: counterContainer; color: root.inactiveColor }
            PropertyChanges { target: candidate; color: root.activeColor }
            PropertyChanges { target: counterLabel; color: root.inactiveColor }
        }
    ]

    transitions: [
        Transition {
            from: "inactive"
            to: "active"
            ParallelAnimation {
                id: activeg
                NumberAnimation { target: root; property: "implicitWidth"; from: widthSize; to: widthToOccupe }
                NumberAnimation { target: root; property: "implicitHeight"; from: heightSize; to: heightToOccupe }
                NumberAnimation { target: counterLabel; property: "font.pointSize"; from: root.smallText; to: root.activeText }

                ColorAnimation { target: root }
                ColorAnimation { target: counterContainer }
                ColorAnimation { target: candidate }
                ColorAnimation { target: counterLabel }

                onStarted: { isZActive = true }
            }
        },
        Transition {
            from: "active"
            to: "inactive"
            ParallelAnimation {
                id: inactive
                NumberAnimation { target: root; property: "implicitWidth"; from: widthToOccupe; to: widthSize }
                NumberAnimation { target: root; property: "implicitHeight"; from: heightToOccupe; to: heightSize }
                NumberAnimation { target: counterLabel; property: "font.pointSize"; from: root.activeText; to: root.smallText }

                ColorAnimation { target: root; property: "color"; from: root.activeColor; to: root.inactiveColor }
                ColorAnimation { target: counterContainer }
                ColorAnimation { target: candidate }
                ColorAnimation { target: counterLabel }

                onFinished: { isZActive = false }
            }
        }
    ]
}

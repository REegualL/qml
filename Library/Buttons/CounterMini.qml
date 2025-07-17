import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import QtQuick.Effects

Rectangle {
    id: root
    property real candidateValue: 0
    property string unit: ""
    property bool isActive: false
    property bool isZActive: false
    property bool needToFix: true
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
    property string iconPath
    property string label: ""
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
    property int bigText: 15


    property int  sizeLabelFont: 10
    property  int widthToOccupe: widthSize
    property  int heightToOccupe: heightSize
    signal upClicked
    signal downClicked
    signal clicked
    signal disableAll
    radius: 4
    color: root.isActive ? root.activeColor : root.inactiveColor
    Rectangle{
        anchors.fill: parent
        anchors.margins: 32
        radius: 32
        height: root.textSize * 1.5
        width:  root.textSize * 1.5
        antialiasing: true
        Text {
            id : idMeasure
            text: root.candidateValue
            font.pointSize: root.textSize
            color: root.isActive ?  root.activeColor : root.activeColor
            width: parent.width
            height: parent.height / 2
            anchors.centerIn: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        ColumnLayout {
            id : bottonsContainer
            visible: root.isActive && root.changeValue
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.rightMargin: 8
            anchors.bottom: parent.bottom
            width: 64
            Item{
                Layout.fillHeight: true
                Layout.fillWidth:  true

            }
            IconBTN {
                id: upButton
                activeColor:  root.isActive ? root.activeColor : "transparent"
                Layout.preferredWidth: root.btnSize
                Layout.preferredHeight: root.btnSize
                Layout.alignment: Qt.AlignCenter
                isSelected: root.isActive
                onClicked: {
                    root.upClicked()
                }
                onTick: root.upClicked()
                rotation: 90
            }
            Item{
                Layout.fillHeight: true
                Layout.fillWidth:  true

            }

            IconBTN {
                id: downButton
                activeColor: root.isActive ?  root.activeColor : "transparent"
                Layout.preferredWidth: root.btnSize
                Layout.preferredHeight: root.btnSize
                Layout.alignment: Qt.AlignVCenter
                isSelected: root.isActive
                rotation: 270
                customRadius: 32
                onClicked: {
                    root.downClicked()
                }
                onTick: root.downClicked()
            }
            Item{
                Layout.fillHeight: true
                Layout.fillWidth:  true
            }
        }
    }

    Text {
        id: counterLabel
        text: root.label
        font.pointSize:  root.smallText
        color:"white"
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.margins: 8
    }
    MouseArea {
        anchors.fill: parent
        onClicked:
        {
            root.isActive =  !root.isActive
            root.clicked()
            root.disableAll()
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
            to : "big"
            ParallelAnimation{
                id : bigg
                NumberAnimation{
                    target: root
                    property: "implicitWidth"
                    from: widthSize
                    to : widthToOccupe
                }
                NumberAnimation{
                    target: root
                    property: "implicitHeight"
                    from: heightSize
                    to : heightToOccupe
                }
                NumberAnimation{
                    target: counterLabel
                    property: "font.pointSize"
                    from: root.smallText
                    to :root.bigText
                }
                onStarted: {
                    isZActive =true
                }
            }
        },
        Transition {
            from: "big"
            to : "small"
            ParallelAnimation{
                id : small
                NumberAnimation{
                    target: root
                    property: "implicitWidth"
                    from: widthToOccupe
                    to : widthSize
                }
                NumberAnimation{
                    target: root
                    property: "implicitHeight"
                    from: heightToOccupe
                    to : heightSize
                }
                NumberAnimation{
                    target: counterLabel
                    property: "font.pointSize"
                    from: root.bigText
                    to :root.smallText
                }
                onFinished: {
                    isZActive =false
                }
            }
        }
    ]
}

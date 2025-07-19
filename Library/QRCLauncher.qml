import QtQuick 2.15
import QtQuick.Layouts 2.15
import "Buttons"
import "Stylist"
import "Containers"

Window {
    id: rootContainer
    width: 640
    height: 480
    visible: true
    color: Color.wildBlueYonder  //! Container main information

    property string futureState: ""

    Rectangle {
        id: loader
        state: "CloseLoad"
        width: contaiWithInteractiveInterface.width
        height: 0
        color: Color.blackChocolate
        radius: 4
        z: 1
        anchors {
            top: parent.top
            right: parent.right
            topMargin: 72
            rightMargin: 4
        }

        states: [
            State {
                name: "Load"
                PropertyChanges {
                    target: loader
                    color: Color.thistle
                    height: contaiWithInteractiveInterface.height
                }
            },
            State {
                name: "CloseLoad"
                PropertyChanges {
                    target: loader
                    color: Color.blackChocolate
                    height: 0
                }
            }
        ]

        transitions: [
            Transition {
                from: "CloseLoad"
                to: "Load"
                SequentialAnimation {
                    ParallelAnimation {
                        NumberAnimation {
                            target: loader
                            property: "height"
                            duration: 300
                        }
                        ColorAnimation {
                            target: loader
                            property: "color"
                            duration: 300
                        }
                    }
                    PauseAnimation { duration: 400 }
                    ScriptAction {
                        script: {
                            TestingState.currentState = rootContainer.futureState
                            loader.state = "CloseLoad"
                        }
                    }
                }
            },
            Transition {
                from: "Load"
                to: "CloseLoad"
                ParallelAnimation {
                    NumberAnimation {
                        target: loader
                        property: "height"
                        duration: 300
                    }
                    ColorAnimation {
                        target: loader
                        property: "color"
                        duration: 300
                    }
                }
            }
        ]
    }

    RowLayout {
        anchors.fill: parent
        anchors.margins: 4

        Rectangle {
            Layout.fillHeight: true
            Layout.preferredWidth: StateObject.widthBTN * 1.2
            color: Color.vampireBlack
            radius: 4

            ColumnLayout {
                anchors.fill: parent
                spacing: 16

                Item {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                }

                SimpleBTN {
                    isActive: TestingState.currentState === TestingState.home
                    onClicked: {
                        loader.state = "Load"
                        rootContainer.futureState = TestingState.home
                    }
                    Layout.alignment: Qt.AlignCenter
                }
                SimpleBTN {
                    isActive: TestingState.currentState === TestingState.settings
                    Layout.alignment: Qt.AlignCenter
                    onClicked: {
                        loader.state = "Load"
                        rootContainer.futureState = TestingState.settings
                    }
                }
                SimpleBTN {
                    isActive: TestingState.currentState === TestingState.exit
                    Layout.alignment: Qt.AlignCenter
                    Layout.bottomMargin: 16
                    onClicked: {
                        loader.state = "Load"
                        rootContainer.futureState = TestingState.exit
                    }
                }
            }
        }

        ColumnLayout {
            id: mainContainer
            Layout.fillHeight: true
            Layout.fillWidth: true

            //! Top bar info
            Item {
                Layout.fillWidth: true
                Layout.preferredHeight: 64

                RowLayout {
                    anchors.fill: parent

                    AnimatedContainer {
                        isAnimated: true
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        widthToOccupe: parent.width
                        heightToOccupe: parent.height
                        activeColor: Color.thistle
                        inactiveColor: Color.dirtyWhite

                        RowLayout {
                            anchors.fill: parent

                            SimpleBTN { Layout.alignment: Qt.AlignCenter }
                            SimpleBTN { Layout.alignment: Qt.AlignCenter }
                            SimpleBTN { Layout.alignment: Qt.AlignCenter }
                        }
                    }

                    AnimatedContainer {
                        isAnimated: true
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        widthToOccupe: parent.width
                        heightToOccupe: parent.height
                        activeColor: Color.thistle
                        inactiveColor: Color.dirtyWhite

                        RowLayout {
                            anchors.fill: parent
                        }
                    }

                    AnimatedContainer {
                        isAnimated: true
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        widthToOccupe: parent.width
                        heightToOccupe: parent.height
                        activeColor: Color.thistle
                        inactiveColor: Color.dirtyWhite

                        RowLayout {
                            anchors.fill: parent
                        }
                    }
                }
            }

            Item {
                id: contaiWithInteractiveInterface
                Layout.fillWidth: true
                Layout.fillHeight: true

                RowLayout {
                    anchors.fill: parent

                    GridLayout {
                        columns: 2
                        rows: 2
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        enabled: TestingState.currentState === TestingState.home
                        visible: TestingState.currentState === TestingState.home

                        AnimatedContainer {
                            id: firstContainer
                            isAnimated: true
                            Layout.fillHeight: true
                            Layout.fillWidth: true
                            widthToOccupe: parent.width
                            heightToOccupe: parent.height

                            DialTest {
                                enabled: parent.isActive
                                widthToOccupe: parent.width
                                heightToOccupe: parent.height
                                height: parent.height / 2
                                width: parent.width / 2
                                anchors.centerIn: parent
                                onClicked: { parent.isActive = true }
                            }

                            onDisableAll: {
                                secondContainer.isActive = false
                                thirdContainer.isActive = false
                                forthContainer.isActive = false
                            }
                        }

                        AnimatedContainer {
                            id: secondContainer
                            isAnimated: true
                            Layout.fillHeight: true
                            Layout.fillWidth: true
                            widthToOccupe: parent.width
                            heightToOccupe: parent.height

                            DialTest {
                                enabled: parent.isActive
                                widthToOccupe: parent.width
                                heightToOccupe: parent.height
                                height: parent.height / 2
                                width: parent.width / 2
                                anchors.centerIn: parent
                                onClicked: { parent.isActive = true }
                            }

                            onDisableAll: {
                                firstContainer.isActive = false
                                thirdContainer.isActive = false
                                forthContainer.isActive = false
                            }
                        }

                        AnimatedContainer {
                            id: thirdContainer
                            isAnimated: true
                            Layout.fillHeight: true
                            Layout.fillWidth: true
                            widthToOccupe: parent.width
                            heightToOccupe: parent.height

                            DialTest {
                                enabled: parent.isActive
                                widthToOccupe: parent.width
                                heightToOccupe: parent.height
                                height: parent.height / 2
                                width: parent.width / 2
                                anchors.centerIn: parent
                                onClicked: { parent.isActive = true }
                            }

                            onDisableAll: {
                                firstContainer.isActive = false
                                secondContainer.isActive = false
                                forthContainer.isActive = false
                            }
                        }

                        AnimatedContainer {
                            id: forthContainer
                            isAnimated: true
                            Layout.fillHeight: true
                            Layout.fillWidth: true
                            widthToOccupe: parent.width
                            heightToOccupe: parent.height

                            DialTest {
                                enabled: parent.isActive
                                widthToOccupe: parent.width
                                heightToOccupe: parent.height
                                height: parent.height / 2
                                width: parent.width / 2
                                anchors.centerIn: parent
                                onClicked: { parent.isActive = true }
                            }

                            onDisableAll: {
                                firstContainer.isActive = false
                                secondContainer.isActive = false
                                thirdContainer.isActive = false
                            }
                        }
                    }

                    GridLayout {
                        columns: 2
                        rows: 2
                        enabled: TestingState.currentState === TestingState.settings
                        visible: TestingState.currentState === TestingState.settings
                        Layout.fillHeight: true
                        Layout.fillWidth: true

                        CounterMini {
                            id: firstCounter
                            label: "first value"
                            isAnimated: true
                            Layout.fillHeight: true
                            Layout.fillWidth: true
                            widthToOccupe: parent.width
                            heightToOccupe: parent.height
                            onDisableAll: {
                                secondtCounter.isActive = false
                                fourtCounter.isActive = false
                                thirdCounter.isActive = false
                            }
                        }

                        CounterMini {
                            id: secondtCounter
                            label: "second value"
                            isAnimated: true
                            Layout.fillHeight: true
                            Layout.fillWidth: true
                            widthToOccupe: parent.width
                            heightToOccupe: parent.height
                            onDisableAll: {
                                firstCounter.isActive = false
                                thirdCounter.isActive = false
                                fourtCounter.isActive = false
                            }
                        }

                        CounterMini {
                            id: thirdCounter
                            label: "third value"
                            isAnimated: true
                            Layout.fillHeight: true
                            Layout.fillWidth: true
                            widthToOccupe: parent.width
                            heightToOccupe: parent.height
                            onDisableAll: {
                                firstCounter.isActive = false
                                secondtCounter.isActive = false
                                fourtCounter.isActive = false
                            }
                        }

                        CounterMini {
                            id: fourtCounter
                            label: "fourth value"
                            candidateValue: 0
                            isAnimated: true
                            Layout.fillHeight: true
                            Layout.fillWidth: true
                            widthToOccupe: parent.width
                            heightToOccupe: parent.height
                            onDisableAll: {
                                firstCounter.isActive = false
                                secondtCounter.isActive = false
                                thirdCounter.isActive = false
                            }
                        }
                    }

                    Item {
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        enabled: TestingState.currentState === TestingState.exit
                        visible: TestingState.currentState === TestingState.exit

                        ColumnLayout {
                            anchors.fill: parent

                            AnimatedContainer {
                                isAnimated: true
                                Layout.fillHeight: true
                                Layout.fillWidth: true
                                widthToOccupe: parent.width
                                heightToOccupe: parent.height
                            }
                            AnimatedContainer {
                                isAnimated: false
                                Layout.fillHeight: true
                                Layout.fillWidth: true
                                widthToOccupe: parent.width
                                heightToOccupe: parent.height
                                activeColor: "transparent"
                                inactiveColor:  "transparent"

                                RowLayout
                                {
                                    anchors.fill: parent
                                    AnimatedContainer {
                                        isAnimated: true
                                        Layout.fillHeight: true
                                        Layout.fillWidth: true
                                        widthToOccupe: parent.width
                                        heightToOccupe: parent.height
                                        activeColor: Color.dirtyWhite
                                        inactiveColor:   Color.lightMossGreen
                                    }
                                    AnimatedContainer {
                                        isAnimated: true
                                        Layout.fillHeight: true
                                        Layout.fillWidth: true
                                        widthToOccupe: parent.width
                                        heightToOccupe: parent.height
                                        activeColor: Color.dirtyWhite
                                        inactiveColor:   Color.lightMossGreen
                                    }
                                    AnimatedContainer {
                                        isAnimated: true
                                        Layout.fillHeight: true
                                        Layout.fillWidth: true
                                        widthToOccupe: parent.width
                                        heightToOccupe: parent.height
                                        activeColor: Color.dirtyWhite
                                        inactiveColor:   Color.lightMossGreen
                                    }
                                    AnimatedContainer {
                                        isAnimated: true
                                        Layout.fillHeight: true
                                        Layout.fillWidth: true
                                        widthToOccupe: parent.width
                                        heightToOccupe: parent.height
                                        activeColor: Color.dirtyWhite
                                        inactiveColor:   Color.lightMossGreen
                                    }
                                    AnimatedContainer {
                                        isAnimated: true
                                        Layout.fillHeight: true
                                        Layout.fillWidth: true
                                        widthToOccupe: parent.width
                                        heightToOccupe: parent.height
                                        activeColor: "transparent"
                                        inactiveColor:  "transparent"
                                        GridLayout
                                        {
                                            columns: 2
                                            rows :2
                                            anchors.fill: parent
                                            AnimatedContainer {
                                                isAnimated: true
                                                Layout.fillHeight: true
                                                Layout.fillWidth: true
                                                widthToOccupe: parent.width
                                                heightToOccupe: parent.height

                                            }
                                            AnimatedContainer {
                                                isAnimated: true
                                                Layout.fillHeight: true
                                                Layout.fillWidth: true
                                                widthToOccupe: parent.width
                                                heightToOccupe: parent.height

                                            }
                                            AnimatedContainer {
                                                isAnimated: true
                                                Layout.fillHeight: true
                                                Layout.fillWidth: true
                                                widthToOccupe: parent.width
                                                heightToOccupe: parent.height
                                            }

                                            AnimatedContainer {
                                                isAnimated: true
                                                Layout.fillHeight: true
                                                Layout.fillWidth: true
                                                widthToOccupe: parent.width
                                                heightToOccupe: parent.height

                                            }

                                        }


                                    }

                                }
                            }
                            AnimatedContainer {
                                isAnimated: true
                                Layout.fillHeight: true
                                Layout.fillWidth: true
                                widthToOccupe: parent.width
                                heightToOccupe: parent.height
                                activeColor: "transparent"
                                inactiveColor:  "transparent"
                                GridLayout
                                {
                                    columns: 2
                                    rows :2
                                    anchors.fill: parent
                                    AnimatedContainer {
                                        isAnimated: true
                                        Layout.fillHeight: true
                                        Layout.fillWidth: true
                                        widthToOccupe: parent.width
                                        heightToOccupe: parent.height

                                    }
                                    AnimatedContainer {
                                        isAnimated: true
                                        Layout.fillHeight: true
                                        Layout.fillWidth: true
                                        widthToOccupe: parent.width
                                        heightToOccupe: parent.height

                                    }
                                    AnimatedContainer {
                                        isAnimated: true
                                        Layout.fillHeight: true
                                        Layout.fillWidth: true
                                        widthToOccupe: parent.width
                                        heightToOccupe: parent.height
                                    }

                                    AnimatedContainer {
                                        isAnimated: true
                                        Layout.fillHeight: true
                                        Layout.fillWidth: true
                                        widthToOccupe: parent.width
                                        heightToOccupe: parent.height

                                    }

                                }

                            }
                            AnimatedContainer {
                                isAnimated: true
                                Layout.fillHeight: true
                                Layout.fillWidth: true
                                widthToOccupe: parent.width
                                heightToOccupe: parent.height
                            }
                        }
                    }
                }
            }
        }
    }
}

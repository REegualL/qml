import QtQuick 2.15
import QtQuick.Layouts  2.15
import "Buttons"
import "Stylist"
import "Containers"

Window {
    width: 640
    height: 480
    visible: true
    color :  Qt.rgba(
                 0.3,  // R: 0.7–1.0
                 0.3,  // G: 0.7–1.0
                 0.3,  // B: 0.7–1.0
                 1
                 )
    RowLayout
    {
        anchors.margins: 4
        anchors.fill: parent
        spacing: 16
        Rectangle
        {
            Layout.fillHeight: true
            Layout.preferredWidth: StateObject.widthBTN * 1.2
            RandomFill{}
            radius: 64

            ColumnLayout{
                anchors.fill: parent
                spacing: 16
                Item {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                }
                SimpleBTN{
                    isActive: TestingState.currentState === TestingState.home
                    onClicked: {
                        TestingState.currentState = TestingState.home
                    }
                    Layout.alignment: Qt.AlignCenter
                }
                SimpleBTN{
                    isActive: TestingState.currentState === TestingState.settings
                    Layout.alignment: Qt.AlignCenter

                    onClicked: {
                        TestingState.currentState = TestingState.settings
                        console.debug(TestingState.currentState)
                    }

                }
                SimpleBTN{
                    isActive: TestingState.currentState === TestingState.exit
                    Layout.alignment: Qt.AlignCenter
                    Layout.bottomMargin: 16
                    onClicked: {
                        TestingState.currentState = TestingState.exit
                    }
                }

            }
        }
        GridLayout
        {
            columns :2
            rows : 2
            enabled:  TestingState.currentState === TestingState.home
            visible:  TestingState.currentState === TestingState.home
            AnimatedContainer{
                id : firstContainer
                isAnimated: true
                Layout.fillHeight:  true;
                Layout.fillWidth: true;
                widthToOccupe: parent.width;
                heightToOccupe: parent.height
                RandomFill{}
                DialTest{
                    enabled: parent.isActive
                    widthToOccupe: parent.width;
                    heightToOccupe: parent.height
                    height: parent.height/2;
                    width:  parent.width/2;
                    anchors.centerIn: parent
                    onClicked:
                    {
                        parent.isActive = true
                    }
                }
                onDisableAll: {
                    secondContainer.isActive = false
                    thirdContainer.isActive = false
                    forthContainer.isActive = false
                }
            }
            AnimatedContainer{
                id : secondContainer

                isAnimated: true
                Layout.fillHeight:  true;
                Layout.fillWidth: true;
                widthToOccupe: parent.width;
                heightToOccupe: parent.height
                RandomFill{}
                DialTest{
                    enabled: parent.isActive

                    widthToOccupe: parent.width;
                    heightToOccupe: parent.height
                    height: parent.height/2;
                    width:  parent.width/2;
                    anchors.centerIn: parent
                    onClicked:
                    {
                        parent.isActive = true
                    }
                }
                onDisableAll: {
                    firstContainer.isActive = false
                    thirdContainer.isActive = false
                    forthContainer.isActive = false
                }
            }
            AnimatedContainer{
                id : thirdContainer

                isAnimated: true
                Layout.fillHeight:  true;
                Layout.fillWidth: true;
                widthToOccupe: parent.width;
                heightToOccupe: parent.height
                RandomFill{}
                DialTest{
                    enabled: parent.isActive

                    widthToOccupe: parent.width;
                    heightToOccupe: parent.height
                    height: parent.height/2;
                    width:  parent.width/2;
                    anchors.centerIn: parent
                    onClicked:
                    {
                        parent.isActive = true
                    }
                }
                onDisableAll: {
                    firstContainer.isActive = false
                    secondContainer.isActive = false
                    forthContainer.isActive = false
                }
            }
            AnimatedContainer{
                id : forthContainer

                isAnimated: true
                Layout.fillHeight:  true;
                Layout.fillWidth: true;
                widthToOccupe: parent.width;
                heightToOccupe: parent.height
                RandomFill{}

                DialTest{
                    enabled: parent.isActive

                    widthToOccupe: parent.width;
                    heightToOccupe: parent.height
                    height: parent.height/2;
                    width:  parent.width/2;
                    anchors.centerIn: parent
                    onClicked:
                    {
                        parent.isActive = true
                    }
                }
                onDisableAll: {
                    firstContainer.isActive = false
                    secondContainer.isActive = false
                    thirdContainer.isActive = false
                }
            }

        }

        GridLayout
        {
            columns :2
            rows : 2
            enabled:  TestingState.currentState === TestingState.settings
            visible:  TestingState.currentState === TestingState.settings
            CounterMini{
                id : firstCounter

                label: "first value"
                isAnimated: true
                Layout.fillHeight:  true;
                Layout.fillWidth: true;
                widthToOccupe: parent.width;
                heightToOccupe: parent.height
                onUpClicked:
                {
                    candidateValue+=0.1
                }
                onDisableAll: {
                    secondtCounter.isActive = false
                    fourtCounter.isActive = false
                    thirdCounter.isActive = false
                }
            }
            CounterMini{
                id : secondtCounter

                label: "second value"

                isAnimated: true
                Layout.fillHeight:  true;
                Layout.fillWidth: true;
                widthToOccupe: parent.width;
                heightToOccupe: parent.height
                onDisableAll: {
                    firstCounter.isActive = false
                    thirdCounter.isActive = false
                    fourtCounter.isActive = false
                }
            }

            CounterMini{
                id : thirdCounter

                label: "third value"

                isAnimated: true
                Layout.fillHeight:  true;
                Layout.fillWidth: true;
                widthToOccupe: parent.width;
                heightToOccupe: parent.height
                onDisableAll: {
                    firstCounter.isActive = false
                    secondtCounter.isActive = false
                    fourtCounter.isActive = false
                }
            }
            CounterMini{
                id : fourtCounter
                label: "fourth value"

                candidateValue: 0
                isAnimated: true
                Layout.fillHeight:  true;
                Layout.fillWidth: true;
                widthToOccupe: parent.width;
                heightToOccupe: parent.height
                onDisableAll: {
                    firstCounter.isActive = false
                    secondtCounter.isActive = false
                    thirdCounter.isActive = false
                }
            }
        }
    }

}

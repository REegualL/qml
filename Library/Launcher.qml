import QtQuick 2.15 import QtQuick.Layouts  2.15 import "BTN" import "Stylist" 
Window { width: 640
height: 480 visible: true title: qsTr("Hello World") RowLayout { anchors.margins: 4 anchors.fill: parent spacing: 16 Rectangle { Layout.fillHeight: true Layout.preferredWidth: StateObject.widthBTN color: Qt.rgba(Math.random(), Math.random(), Math.random(), 0.6) radius: 64 
ColumnLayout{ anchors.fill: parent
Item { Layout.fillHeight: true
Layout.fillWidth: true }
SimpleBTN{ isActive: TestingState.currentState === TestingState.home
onClicked: { TestingState.currentState = TestingState.home }
}
SimpleBTN{ isActive: TestingState.currentState === TestingState.settings
onClicked: { TestingState.currentState = TestingState.settings console.debug(TestingState.currentState) }

}
SimpleBTN{ isActive: TestingState.currentState === TestingState.exit
onClicked: { TestingState.currentState = TestingState.exit }
}
Item { Layout.preferredHeight: StateObject.heightBTN
Layout.preferredWidth: StateObject.widthBTN }
}
}
Rectangle { radius: 64 
Layout.fillHeight: true Layout.fillWidth: true color: Qt.rgba(Math.random(), Math.random(), Math.random(), 0.6) 



DialTest{ width: 100
height: 100 }
}
}
}

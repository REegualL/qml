pragma Singleton

import QtQuick 2.15

Item {
    id: root
    readonly property string pressed :  "PRESSED"
    readonly property string released :  "RELEASED"
    readonly property string hovered :  "HOVERED"

    readonly property int widthBTN :  50
    readonly property int heightBTN :  50

    readonly property int rigthMargin :  50
    readonly property int leftMargin :  8
    readonly property int radiusContainer :  32


}

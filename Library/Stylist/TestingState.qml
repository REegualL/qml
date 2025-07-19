
pragma Singleton 
import QtQuick 2.15 
Item { id: root
property string currentState : root.home 
readonly property string home :  "HOME"
                            readonly property string settings :  "SETTINGS"
    readonly property string exit :  "EXIT" }

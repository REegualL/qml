pragma Singleton
import QtQuick 2.15
/*! * \brief Singleton che definisce lo stile del tema Marchesini. */ Item { id: root

    // Temi disponibili
    enum Theme { Light, Dark }

    // Tema

    //! Tema corrente dell'applicazione.
    property var theme: Style.Light
    //! Restituisce vero se il tema corrente è LightMode, falso altrimenti.
    readonly property bool lightMode: root.theme === Style.Light
    //! Restituisce vero se il tema corrente è DarkMode, falso altrimenti.
    readonly property bool darkMode: root.theme === Style.Dark
    // Colori

    //! Colore nero principale.
    readonly property color black: lightMode ? "black" : "#212121"
    //! Colore bianco principale.
    readonly property color white: lightMode ? "white" : "#FDFDFD"
    //! Colore primario dei componenti.
    readonly property color primary: lightMode ? primary900 : primary200
    //! Colore di brand.
    readonly property color brand: brand900
    //! Colore di warning.
    readonly property color warning: warning800
    //! Colore di warning.
    readonly property color warningLight: warning50
    //! Colore di successo.
    readonly property color success: success600
    //! Colore di successo, tinta di sfondo.
    readonly property color successLight: success50
    //! Colore di info.
    readonly property color info: info700
    //! Colore di info.
    readonly property color infoLight: info50
    //! Colore di errore.
    readonly property color error: brand
    //! Colore di errore.
    readonly property color errorLight: brand50
    //! Colore dei testi dell'applicazione.
    readonly property color foreground: lightMode ? primary900 : primary100
    //! Colore di sfondo dei componenti.
    readonly property color background: lightMode ? primary100 : black
    //! Colore di sfondo dell'applicazione.
    readonly property color applicationBackground: lightMode ? white : primary900
    //! Colore alternativo del testo dei componenti quando abilitati.
    readonly property color alternateTextColor: lightMode ? white : black
    //! Colore delle icone.
    readonly property color iconColor: lightMode ? primary900 : primary50
    //! Colore degli indicatori dei componenti.
    readonly property color indicatorColor: lightMode ? white : black
    //! Colore di bordo dei componenti.
    readonly property color borderColor: lightMode ? primary900 : primary100
    //! Colore del componente disabilitato.
    readonly property color disabledColor: lightMode ? primary400 : primary500
    //! Colore del componente disabilitato alternativo, se questo possiede un altro stato.
    readonly property color disabledColor2: lightMode ? primary200 : primary700
    //! Altro colore del componente disabilitato alternativo, se questo possiede un altro stato.
    readonly property color disabledColor3: lightMode ? white : primary600
    //! Colore del testo di placeholder.
    readonly property color placeholderTextColor: lightMode ? primary500 : primary600
    //! Colore del testo del componente disabilitato.
    readonly property color disabledTextColor: lightMode ? primary100 : primary800
    //! Colore del testo del componente disabilitato, se questo possiede un altro stato.
    readonly property color disabledTextColor2: lightMode ? primary50 : primary500
    //! Altro colore del testo del componente disabilitato, se questo possiede un altro stato.
    readonly property color disabledTextColor3: lightMode ? primary300 : primary500
    //! Colore dello stato off dello switch.
    readonly property color switchOffColor: lightMode ? primary500 : primary600
    //! Colore di sfondo del ComboxBox
    readonly property color comboBackgroundColor: applicationBackground
    //! Colore di bordo dei componenti.
    readonly property color comboOpenedborderColor: lightMode ? primary400 : primary200
    //! Colore del bottone quando è a default.
    readonly property color buttonDefaultColor: lightMode ? primary900 : primary50
    //! Colore alternativo del bottone quando è a default.
    readonly property color buttonDefaultColor2: lightMode ? white : primary900
    //! Colore dello stato pressed del bottone.
    readonly property color buttonPressedColor: lightMode ? primary700 : primary300
    //! Colore alternativo dello stato pressed del bottone.
    readonly property color buttonPressedColor2: lightMode ? primary200 : primary400
    //! Colore di highlight quando lo stato è checkable per pulsante primario.
    readonly property color buttonCheckableColor: lightMode ? primary700 : primary400
    //! Colore di highlight quando lo stato è checkable per pulsante secondario.
    readonly property color buttonCheckableColor2: lightMode ? primary300 : primary700
    //! Colore dello stato checked del bottone.
    readonly property color buttonCheckedColor: lightMode ? primary700 : primary300
    //! Colore alternativo del bottone quando è a default.
    readonly property color buttonCheckedColor2: lightMode ? white : primary900
    //! Colore di sfondo dello slider.
    readonly property color sliderBackgroundColor: lightMode ? primary300 : primary500
    //! Colore di accent dello slider (parte a sinistra)
    readonly property color sliderBarColor: lightMode ? primary800 : primary300
    //! Colore dell'handle dello slider.
    readonly property color sliderHandleColor: lightMode ? primary100 : primary500
    //! Colore di sfondo dell'oggetto selezionato nella tree view.
    readonly property color treeViewHighlightedColor: lightMode ? primary300 : primary500
    //! Colore di sfondo del separatore per la taskbar.
    readonly property color taskbarSeparatorColor: lightMode ? primary300 : white
    //! Colore di sfondo della progress bar.
    readonly property color progressBarBackgroundColor: Style.background
    //! Colore di bordo della progress bar.
    readonly property color progressBarBorderColor: lightMode ? primary300 : primary500
    //! Colore dell'indicatore della progress bar.
    readonly property color progressBarIndicatorColor: lightMode ? primary800 : primary300
    //! Colore del ToolTip.
    readonly property color toolTipColor: primary
    //! Colore del testo del ToolTip.
    readonly property color toolTipTextColor: lightMode ? white : primary900
    //! Colore del bordo del ToolTip.
    readonly property color toolTipBorderColor: lightMode ? primary700 : primary400
    //! Colore di sfondo dello sticky note.
    readonly property color stickyNoteBackgroundColor: warning100
    //! Colore dell'header dello sticky note.
    readonly property color stickyNoteHeaderColor: warning400
    //! Colore del bordo dello sticky note.
    readonly property color stickyNoteBorderColor: warning400
    //! Colore del testo dello sticky note.
    readonly property color stickyNoteTextColor: primary700
    //! Indice di gradazione dell'ombra, da utilizzare negli array delle palette.
    enum Shade { Shade50 , Shade100, Shade200, Shade300, Shade400, Shade500, Shade600, Shade700, Shade800, Shade900 }

    readonly property color primary50:  "#FBFBFB" // bianco readonly property color primary100: "#F7F7F7" readonly property color primary200: "#F1F1F1" readonly property color primary300: "#E5E5E5" readonly property color primary400: "#D9D9D9" readonly property color primary500: "#A4A4A4" readonly property color primary600: "#7A7A7A" readonly property color primary700: "#666666" readonly property color primary800: "#474747" readonly property color primary900: "#3D4142" // black
    //! Vettore dei colori primary grey, dal più chiaro al più scuro.
    readonly property var primaries: [ primary50, primary100, primary200, primary300, primary400, primary500, primary600, primary700, primary800, primary900 ]
    //! Colore brand Marchesini. I valori vanno dal più chiaro al più scuro.
    readonly property color brand50:  "#FFEBEE"
    readonly property color brand100: "#FECDD2"
    readonly property color brand200: "#EE9A9B"
    readonly property color brand300: "#E37474"
    readonly property color brand400: "#ED5452"
    readonly property color brand500: "#F24439"
    readonly property color brand600: "#E33A38"
    readonly property color brand700: "#D13132"
    readonly property color brand800: "#C42A2B"
    readonly property color brand900: "#B51F1F" // rosso Marchesini

    //! Vettore dei colori brand, dal più chiaro al più scuro.
    readonly property var brands: [ brand50, brand100, brand200, brand300, brand400, brand500, brand600, brand700, brand800, brand900 ]
    //! Colore di warning, toni di giallo. I valori vanno dal più chiaro al più scuro.
    readonly property color warning50:  "#FFF7E6"
    readonly property color warning100: "#FFFAC1"
    readonly property color warning200: "#FEF697"
    readonly property color warning300: "#FDF16B"
    readonly property color warning400: "#FBED46" // yellow readonly property color warning500: "#F8E814" readonly property color warning600: "#FFDC1C" readonly property color warning700: "#FFC30F" readonly property color warning800: "#FFAA00" // light orange readonly property color warning900: "#FE7F00" // orange

    //! Vettore dei colori brand, dal più chiaro al più scuro.
    readonly property var warnings: [ warning50, warning100, warning200, warning300, warning400, warning500, warning600, warning700, warning800, warning900 ]
    //! Colore di info, toni di verde. I valori vanno dal più chiaro al più scuro.

    readonly property color success50: "#E7F7E9"
    readonly property color success100: "#C5EACA"
    readonly property color success200: "#9EDCA8"
    readonly property color success300: "#75D085"
    readonly property color success400: "#52C56A"
    readonly property color success500: "#2ABA4E"
    readonly property color success600: "#1FAB45"
    readonly property color success700: "#0D9839"
    readonly property color success800: "#00872E"
    readonly property color success900: "#006818"
    //! Vettore dei colori di successo, dal più chiaro al più scuro.
    readonly property var successes: [ success50, success100, success200, success300, success400, success500, success600, success700, success800, success900 ]
    //! Colore di info, toni di blu. I valori vanno dal più chiaro al più scuro.
    readonly property color info50:  "#E3F3FF"
    readonly property color info100: "#BBE1FF"
    readonly property color info200: "#8DCFFF"
    readonly property color info300: "#58BBFF"
    readonly property color info400: "#25ABFF"
    readonly property color info500: "#009BFF"
    readonly property color info600: "#008CFF"
    readonly property color info700: "#1979FF"
    readonly property color info800: "#2266EC"
    readonly property color info900: "#2A44CD"
    //! Vettore dei colori di info, dal più chiaro al più scuro.
    readonly property var infos: [ info50, info100, info200, info300, info400, info500, info600, info700, info800, info900 ]
    //! Abilita o disabilita il Dark Mode.
    function setDarkMode(enable: bool){ // Questo giro viene fatto per evitare il binding loop const newTheme = (enable ? Style.Dark : Style.Light) if(root.theme !== newTheme) { root.theme = newTheme }
    }

    //! Abilitazione animazioni.
    readonly property bool useAnimation: true
    //! Durata delle animazioni.
    readonly property int animationDuration: 100 }

/****************************************************************************
**
** Copyright (C) 2014 Digia Plc and/or its subsidiary(-ies).
** Contact: http://www.qt-project.org/legal
**
** This file is part of Qt Creator.
**
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and Digia.  For licensing terms and
** conditions see http://qt.digia.com/licensing.  For further information
** use the contact form at http://qt.digia.com/contact-us.
**
** GNU Lesser General Public License Usage
** Alternatively, this file may be used under the terms of the GNU Lesser
** General Public License version 2.1 as published by the Free Software
** Foundation and appearing in the file LICENSE.LGPL included in the
** packaging of this file.  Please review the following information to
** ensure the GNU Lesser General Public License version 2.1 requirements
** will be met: http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html.
**
** In addition, as a special exception, Digia gives you certain additional
** rights.  These rights are described in the Digia Qt LGPL Exception
** version 1.1, included in the file LGPL_EXCEPTION.txt in this package.
**
****************************************************************************/

import QtQuick 2.1
import QtQuick.Controls 1.1 as Controls
import QtQuick.Controls.Styles 1.1

Controls.CheckBox {

    id: checkBox

    property color borderColor: "#222"
    property color highlightColor: "orange"
    property color textColor: colorLogic.textColor

    onTextChanged: {
        if (text.charAt(0) !== " ")
            text = "    " + text
    }

    property variant backendValue

    ExtendedFunctionButton {
        x: 22
        backendValue: checkBox.backendValue
        visible: checkBox.enabled
    }

    ColorLogic {
        id: colorLogic
        backendValue: checkBox.backendValue
        onValueFromBackendChanged: {
            if (checkBox.checked !== valueFromBackend)
                checkBox.checked = valueFromBackend;
        }
    }

    onCheckedChanged: {
        if (backendValue.value !== checkBox.checked)
            backendValue.value = checkBox.checked;
    }

    style: CheckBoxStyle {
        spacing: 8
        label: Controls.Label { text: control.text ; color: checkBox.textColor }
        indicator:  Item {
            implicitWidth: 16
            implicitHeight: 16
            Image { source: "qrc:qmldesigner/images/checkbox_" +
                            (control.checked ? "checked": "unchecked") +
                            (control.pressed ? "_pressed": "") + ".png" }
        }
    }                                          //control.pressed ? "qrc:qmldesigner/images/checkbox_unchecked_pressed.png" :


}

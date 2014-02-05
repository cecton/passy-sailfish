/*
  Copyright (C) 2013 Kristoffer Gronlund
  Contact: Kristoffer Gronlund <krig@koru.se>
  All rights reserved.

  You may use this file under the terms of BSD license as follows:

  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of the Jolla Ltd nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR
  ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

import QtQuick 2.0
import Sailfish.Silica 1.0
import "../utils.js" as Utils

Page {
    id: page

    // To enable PullDownMenu, place our content in a SilicaFlickable
    SilicaFlickable {
        anchors.fill: parent


        // PullDownMenu and PushUpMenu must be declared in SilicaFlickable, SilicaListView or SilicaGridView
        PullDownMenu {
            MenuItem {
                text: "About"
                onClicked: pageStack.push(Qt.resolvedUrl("AboutPage.qml"))
            }

            MenuItem {
                text: "Clear clipboard"
                onClicked: column.clearFields()
            }
        }

        // Tell SilicaFlickable the height of its content.
        contentHeight: column.height

        // Place our content in a Column.  The PageHeader is always placed at the top
        // of the page, followed by our content.
        Column {
            id: column

            function clearFields() {
                keyField.text = ""
                Clipboard.text = ""
            }

            function updateHint() {
                if (passwordField.text.length > 0) {
                    hint.text = Utils.genpass(passwordField.text, "foo").substr(0, 6)
                }
                else {
                    hint.text = ""
                }
            }

            function pwdGotoNext() {
                column.updateHint()
                keyField.focus = true
            }

            function copyPassword() {
                var pwd
                pwd = Utils.genpass(passwordField.text, keyField.text)
                Clipboard.text = pwd
            }

            width: page.width
            spacing: Theme.paddingLarge

            anchors.verticalCenter: parent.verticalCenter

            PageHeader {
                title: "Passy"
            }

            TextField {
                id: passwordField
                echoMode: TextInput.Password
                placeholderText: "password"
                anchors.horizontalCenter: parent.horizontalCenter
                width: Theme.itemSizeLarge*3
                onClicked: column.updateHint()

                EnterKey.enabled: text || inputMethodComposing
                EnterKey.iconSource: "image://theme/icon-m-enter-next"
                EnterKey.onClicked: column.pwdGotoNext()
            }

            TextField {
                id: keyField
                placeholderText: "key"
                anchors.horizontalCenter: parent.horizontalCenter
                width: Theme.itemSizeLarge*3
                onClicked: column.updateHint()
                inputMethodHints: Qt.ImhNoAutoUppercase

                EnterKey.enabled: (passwordField.text && text) || inputMethodComposing
                EnterKey.onClicked: column.copyPassword()
            }

            Button {
                id: copier
                text: "Copy"
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: column.copyPassword()
            }

            Label {
                id: hint
                text: ""
                color: Theme.secondaryColor
                anchors.horizontalCenter: parent.horizontalCenter
            }

        }
    }
}



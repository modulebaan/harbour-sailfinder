/*
*   This file is part of Sailfinder.
*
*   Sailfinder is free software: you can redistribute it and/or modify
*   it under the terms of the GNU General Public License as published by
*   the Free Software Foundation, either version 3 of the License, or
*   (at your option) any later version.
*
*   Sailfinder is distributed in the hope that it will be useful,
*   but WITHOUT ANY WARRANTY; without even the implied warranty of
*   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
*   GNU General Public License for more details.
*
*   You should have received a copy of the GNU General Public License
*   along with Sailfinder.  If not, see <http://www.gnu.org/licenses/>.
*/

import QtQuick 2.0
import Sailfish.Silica 1.0

Item {
    anchors.fill: parent

    function populate() {
        if(api.profile !== "null") {
            background.source = api.profile.photos.getPhoto(0).url
        }
    }

    Connections {
        target: api
        onProfileChanged: populate()
    }

    Image {
        id: background
        anchors.fill: parent
        asynchronous: true
        opacity: progress/3 // background
        Behavior on opacity { FadeAnimator {} }
        onStatusChanged: {
            if(status == Image.Error) {
                console.warn("Can't load image as cover background")
            }
        }
    }

    Column {
        width: parent.width
        anchors.centerIn: parent

        Image {
            width: Theme.itemSizeSmall
            anchors.horizontalCenter: parent.horizontalCenter
            source: "qrc:///images/cover-logo.png"
        }

        TextLabel {
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: Theme.fontSizeExtraLarge
            //% "Profile"
            text: qsTrId("sailfinder-profile")
        }
    }
}

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

var msgCode = {"FB_TOKEN": 0, "ERROR": 1, "DEBUG": 42};

// Create our JSON payload and send it to QML
function send(type, data) {
    var payload = new Object;
    payload.type = type;
    payload.data = data;
    navigator.qt.postMessage(JSON.stringify(payload))
}

// Filters the access token from the Facebook OAuth hidden page
function filterAccessToken(data) {
    var accessTokenFilterRegex = /(?=access_token=)(.+?)(?=&)/;

    // Run the RegExp on the document data
    var accessToken = accessTokenFilterRegex.exec(data)[0]

    // Check if the RegExp found our access_token and split it
    if(accessToken.indexOf("access_token=") !== -1) {
        accessToken = accessToken.split("=")[1];
        send(msgCode["FB_TOKEN"], accessToken);
    }
    // If not, send out an error message
    else {
        send(msgCode["ERROR"], accessToken);
    }

    send(msgCode["DEBUG"], accessToken);
}

filterAccessToken(document.documentElement.innerHTML)

/*
 * Copyright (c) 2013 Daniel Vrátil <dan@progdan.cz>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
 *
 */

import bb.cascades 1.0

Page {
    Container {
        
        layout: StackLayout {
            orientation: LayoutOrientation.TopToBottom;
        }

        leftPadding: 20;
        rightPadding: 20;
        topPadding: 20;
        bottomPadding: 20;
        
        Label {
            text: "Simple Counter"; // no qsTr
            preferredWidth: 2000; // hack :)
            textStyle {
                textAlign: TextAlign.Center;
                fontSize: FontSize.XXLarge;
            }
        }

        Label {
            text: "<html>" +
                  qsTr("&copy; 2013 by Daniel Vrátil<br />" + 
                       "<a href=\"mailto:dan@progdan.cz\">dan@progdan.cz</a><br />" +
                       "<a href=\"http://www.progdan.cz\">www.progdan.cz</a><br /><br />" + 
                       "This application is available under the GNU General Public License (GPL). " +
                       "You can report issues, check out the source code, submit patches and browse " +
                       "my other projects on <a href=\"https://github.com/danvratil/\">github.com/danvratil</a>." ) +
                  "</html>";
            textStyle {
                textAlign: TextAlign.Center;
                fontSize: FontSize.Large;   
            }

            multiline: true;
        }
    }
}

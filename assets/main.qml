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
import bb.system 1.0

Page {
    id: root;

    property int count: 0;
    
    actions: [
        ActionItem {
            id: resetAction;
            title: qsTr("Reset counter");
            imageSource: "asset:///icons/ic_clear.png";
    
            ActionBar.placement: ActionBarPlacement.InOverflow;
            
            onTriggered: {
                confirmDialog.exec();
                if (confirmDialog.result === SystemUiResult.ConfirmButtonSelection) {
                   root.count = 0;
                }
            }
        },
        
        ActionItem {
            id: decrementAction;
            title: qsTr("Decrement");
            imageSource: "asset:///icons/ic_remove.png";
          
            ActionBar.placement: ActionBarPlacement.InOverflow;

            onTriggered: {
                root.count--;
            }
        }
    ]

    Container {
        layout: DockLayout {}

        gestureHandlers: [
            TapHandler {
                onTapped: {
                    root.count++;
                }
            }
        ]

        Label {
            id: button;

            horizontalAlignment: HorizontalAlignment.Center;
            verticalAlignment: VerticalAlignment.Center;

            textStyle.fontSize: FontSize.PointValue;
            textStyle.fontSizeValue: 50;
            textStyle.textAlign: TextAlign.Center;

            text: root.count;
        }

        attachedObjects: [
            LayoutUpdateHandler {
                id: layout;
            }
        ] 
    }
    
    attachedObjects: [
        SystemDialog {
            id: confirmDialog;
            title: qsTr("Confirm reset");

            body: qsTr("Are you sure you want to reset the counter?");

            confirmButton.label: qsTr("Reset counter");
            cancelButton.label: qsTr("Cancel");
        }
    ]
}

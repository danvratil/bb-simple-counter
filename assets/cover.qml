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

Container {
    id: root;
    
    property int count: 0;

    // FIXME: This does not work for some reason and the background
    // is white by default, so we hardcode black instead
    //background: SystemDefaults.Paints.ContainerBackground;
    background: Color.Black;

    layout: DockLayout {}

    Label {
        horizontalAlignment: HorizontalAlignment.Center;
        verticalAlignment: VerticalAlignment.Center;

        text: count;

        textStyle.fontSize: FontSize.PointValue;
        textStyle.fontSizeValue: (root.count < 100) ? 40 :
                                 (root.count < 1000) ? 35 : 30;
    }
}
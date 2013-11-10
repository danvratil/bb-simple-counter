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

#include "cover.h"

#include <bb/cascades/Container>
#include <bb/cascades/QmlDocument>

Cover::Cover(QObject *parent):
	bb::cascades::SceneCover(parent)
{
	bb::cascades::QmlDocument * const qml = bb::cascades::QmlDocument::create("asset:///cover.qml").parent(this);
	mContainer = qml->createRootObject<bb::cascades::Container>();
	if (!mContainer) {
		return;
	}

	setContent(mContainer);
}

Cover::~Cover()
{
}

void Cover::setCount(int count)
{
	mContainer->setProperty("count", count);
}


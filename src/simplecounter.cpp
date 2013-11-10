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

#include "simplecounter.h"
#include "cover.h"

#include <bb/cascades/QmlDocument>
#include <bb/cascades/AbstractPane>
#include <bb/cascades/Application>
#include <bb/cascades/Container>
#include <bb/cascades/SceneCover>

#include <QtCore/QSettings>

SimpleCounter::SimpleCounter():
	QObject()
{
    connect(bb::cascades::Application::instance(), SIGNAL(aboutToQuit()),
            this, SLOT(appAboutToQuit()));

	bb::cascades::QmlDocument * const qml = bb::cascades::QmlDocument::create("asset:///main.qml").parent(this);
	bb::cascades::AbstractPane * const root = qml->createRootObject<bb::cascades::AbstractPane>();
	if (!root) {
		return;
	}
	bb::cascades::Application::instance()->setScene(root);

	const int propertyIndex = root->metaObject()->indexOfProperty("count");
	Q_ASSERT(propertyIndex != -1);
	const QMetaProperty countProperty = root->metaObject()->property(propertyIndex);

	const int slotIndex = metaObject()->indexOfSlot("countChanged()");
	const QMetaMethod slot = metaObject()->method(slotIndex);
	connect(root, countProperty.notifySignal(), this, slot);

	mCover = new Cover(this);
	bb::cascades::Application::instance()->setCover(mCover);

	setCount(loadCount());
}

SimpleCounter::~SimpleCounter()
{

}

void SimpleCounter::appAboutToQuit()
{
	saveCount(getCount());
}

void SimpleCounter::countChanged()
{
	const int count = getCount();
	saveCount(count);
	mCover->setCount(count);
}

int SimpleCounter::getCount()
{
	bb::cascades::AbstractPane *pane = bb::cascades::Application::instance()->scene();
	if (!pane) {
		return 0;
	}

	return pane->property("count").toInt();
}

void SimpleCounter::setCount(int count)
{
	bb::cascades::AbstractPane *pane = bb::cascades::Application::instance()->scene();
	if (!pane) {
		return;
	}

	pane->setProperty("count", count);
}

int SimpleCounter::loadCount()
{
	QSettings settings(this);
	return settings.value(QLatin1String("count"), 0.0).toInt();
}

void SimpleCounter::saveCount(int count)
{
	QSettings settings(this);
	settings.setValue(QLatin1String("count"), count);
}

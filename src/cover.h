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


#ifndef COVER_H_
#define COVER_H_

#include <bb/cascades/SceneCover>

namespace bb {
	namespace cascades {
		class Container;
	}
}

class Cover: public bb::cascades::SceneCover
{
	Q_OBJECT

  public:
	explicit Cover(QObject *parent);
	virtual ~Cover();

	void setCount(int count);

  private:
	bb::cascades::Container *mContainer;

};

#endif /* COVER_H_ */

#include "navigation.h"

navigation::navigation(QObject *parent)
    : QObject{parent}
{
    source = QGeoPositionInfoSource::createDefaultSource(this);
    if (source) {
        connect(source, SIGNAL(positionUpdated(QGeoPositionInfo)),
                this, SLOT(positionUpdated(QGeoPositionInfo)));
        source->startUpdates();
    }
}

void navigation::positionUpdated(const QGeoPositionInfo &info)
{
    qDebug() << "Current position: " << info;
    latitude = info.coordinate().latitude();
    longitude = info.coordinate().longitude();
}

double navigation::getLatitude()
{
    return latitude;
}

double navigation::getLongitude()
{
    return longitude;
}

void navigation::saveCoordinates()
{
    database db;
    db.connectBase();

}

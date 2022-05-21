#ifndef NAVIGATION_H
#define NAVIGATION_H

#include <QObject>
#include <QGeoPositionInfoSource>
#include <QDebug>
#include "database.h"

class navigation : public QObject
{
    Q_OBJECT
public:
    explicit navigation(QObject *parent = nullptr);

    Q_INVOKABLE void positionUpdated(const QGeoPositionInfo &info);
    Q_INVOKABLE double getLatitude();
    Q_INVOKABLE double getLongitude();
    Q_INVOKABLE void saveCoordinates();


private:
    QGeoPositionInfoSource *source;
    double latitude;
    double longitude;

signals:

};

#endif // NAVIGATION_H

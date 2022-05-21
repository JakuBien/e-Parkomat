#ifndef DATABASE_H
#define DATABASE_H

#include <QObject>
#include <QtDebug>
#include <QtSql>

class database : public QObject
{
    Q_OBJECT
public:
    explicit database(QObject *parent = nullptr);

    Q_INVOKABLE QSqlDatabase getDb() const;
    Q_INVOKABLE void connectBase();
    Q_INVOKABLE bool addToBase(QString email, QString password, QString password2);
    Q_INVOKABLE bool loginToBase(QString email, QString password);
    Q_INVOKABLE void addCarToBase(QString plates);
    Q_INVOKABLE int getCarID(QString plate);
    Q_INVOKABLE void addLocatoinToBase(double latitude, double longitude, int id_c);

private:
    QSqlDatabase db;
    static int userID;

};

#endif // DATABASE_H

#ifndef LOGIN_H
#define LOGIN_H

#include <QObject>
#include <QtDebug>
#include <QPoint>
#include <QtSql/QSql>
#include <QtSql/QSqlDatabase>

class login : public QObject
{
    Q_OBJECT
public:
    explicit login(QObject *parent = nullptr);

    Q_INVOKABLE void test();
    Q_INVOKABLE void loadMainWindow();

signals:

};

#endif // LOGIN_H

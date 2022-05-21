#include "login.h"

login::login(QObject *parent)
    : QObject{parent}
{

}

void login::test()
{
    qDebug() << "Hello World from C++";
}

void login::loadMainWindow()
{
    qDebug() << "Check if email and password are correnct.";
}


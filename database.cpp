#include "database.h"


database::database(QObject *parent)
    : QObject{parent}
{

}


void database::connectBase()
{
    db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName("C:/Users/bieni/Documents/Qt Projects/e-Parkomat3/parkomat.db");

    if(db.open()) {
        qDebug() << "Database opened correnctly";
    }
    else {
        qDebug() << "Database error";
    }
}

bool database::addToBase(QString email, QString password, QString password2)
{
    bool registered = false;
    if(password == password2){
        QSqlQuery q;
        q.prepare("INSERT INTO users (email, password) "
                  "VALUES (:email, :password);");

        QVariant vemail = email;
        QVariant vpassword = password;

        q.bindValue(":email", vemail);
        q.bindValue(":password", vpassword);

        if(q.exec()){
            qDebug() << "User added";
            registered = true;
        }
        else{
            qDebug() << "User cannot be added";
        }

    }
    else {
        qDebug() << "Wrong password.";
    }

    return registered;

}

bool database::loginToBase(QString email, QString password)
{
    bool accessGranted = false;

    QSqlQuery q;
    q.prepare("SELECT * FROM users WHERE email = :email AND password = :password");

    q.bindValue(":email", email);
    q.bindValue(":password", password);

    if(q.exec()){
        while(q.next()) {
            QString emailDB = q.value(1).toString();
            QString passwordDB = q.value(2).toString();

            if(emailDB == email && passwordDB == password){
                qDebug() << "Access granted.";
                userID = q.value(0).toInt();
                accessGranted = true;
            }
        }
        if(!accessGranted){
            qDebug() << "Something wrong with the email or password.";
        }

    }
    else{
        qDebug() << "Wrong email or password.";
    }

    return accessGranted;
}

void database::addCarToBase(QString plates)
{
        QSqlQuery q;
        q.prepare("INSERT INTO cars (plates, id_u) "
                  "VALUES (:plates, :id_u);");

        q.bindValue(":plates", plates);
        q.bindValue(":id_u", userID);

        if(q.exec()){
            qDebug() << "Car added";
        }
        else{
            qDebug() << "Car cannot be added";
        }

}

int database::getCarID(QString plate)
{
    int carID = -1;
    QSqlQuery q;
    q.prepare("SELECT * FROM cars WHERE plate = :plate AND id_u = :userID");

    q.bindValue(":plate", plate);
    q.bindValue(":userID", userID);

    if(q.exec()){
        carID = q.value(0).toUInt();
    }
    return carID;
}


void database::addLocatoinToBase(double latitude, double longitude, int id_c)
{
    QSqlQuery q;
    q.prepare("INSERT INTO location (id_c, latitude, longitude) "
              "VALUES (:plates, :id_u);");

    //Wybieram rejestracje -> biore id_c -> dodaje lokalizacje samochodu
    q.bindValue(":id_c", id_c);
    q.bindValue(":latitude", latitude);
    q.bindValue(":longitude", longitude);

    if(q.exec()){
        qDebug() << "Location added";
    }
    else{
        qDebug() << "Location cannot be added";
    }
}




QSqlDatabase database::getDb() const
{
    return db;
}

#include <QApplication>
#include <QQmlApplicationEngine>
#include <QList>
#include <QToolButton>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

  /*  QToolButton *b = new QToolButton(this);
    QIcon *ico = new QIcon();
    ico->addPixmap(QPixmap("on.jpg"),QIcon::Normal,QIcon::On);
    [ico->addPixmap(QPixmap("off.jpg"),QIcon::Normal,QIcon::Off);
     b->setIcon(*ico);
    b->setCheckable(true);*/
    return app.exec();
}

#include <QApplication>
#include <QQmlApplicationEngine>
#include <QList>
#include <QToolButton>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.addImportPath(QStringLiteral("qrc:/"));
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));


    return app.exec();
}

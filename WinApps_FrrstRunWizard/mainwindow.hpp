#ifndef WIZARDMAINWINDOW_HPP
#define WIZARDMAINWINDOW_HPP

#include <QMainWindow>
#include <QStateMachine>

QT_BEGIN_NAMESPACE
namespace Ui { class WizardMainWindow; }
QT_END_NAMESPACE

class WizardMainWindow : public QMainWindow
{
    Q_OBJECT

public:
    WizardMainWindow(QWidget *parent = nullptr);
    ~WizardMainWindow();

private:
    Ui::WizardMainWindow *ui;
    QStateMachine * machine;
};
#endif // WIZARDMAINWINDOW_HPP

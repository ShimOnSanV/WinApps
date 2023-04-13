#ifndef WIZARDMAINWINDOW_HPP
#define WIZARDMAINWINDOW_HPP

#include <QMainWindow>
#include <QStateMachine>
#include <QGuiApplication>
#include <QScreen>
#include <iostream>

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
    QStateMachine * m_stateMachine;
};
#endif // WIZARDMAINWINDOW_HPP

#ifndef WIZARDMAINWINDOW_HPP
#define WIZARDMAINWINDOW_HPP
#include <iostream>

#include "InstalationStateEnum.hpp"

#include <QMainWindow>
#include <QStateMachine>
#include <QGuiApplication>
#include <QScreen>

#include <list>

QT_BEGIN_NAMESPACE
namespace Ui { class WizardMainWindow; }
QT_END_NAMESPACE

class WizardMainWindow : public QMainWindow
{
    Q_OBJECT

public:
    WizardMainWindow(QWidget *parent = nullptr);
    ~WizardMainWindow();

private slots:

    void on_TheStartButton_clicked();

    void on_stopInstalation_clicked();

private:
    Ui::WizardMainWindow *ui;
    QStateMachine * m_stateMachine;
    EInstalationStates m_currentStateName;
    std::list<QState*> m_statesList;

    void setTheState(const EInstalationStates & _instalationState);
    QState * state1;
};
#endif // WIZARDMAINWINDOW_HPP

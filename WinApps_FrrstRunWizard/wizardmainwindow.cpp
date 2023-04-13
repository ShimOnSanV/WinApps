#include "mainwindow.hpp"
#include "ui_wizardmainwindow.h"

WizardMainWindow::WizardMainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::WizardMainWindow)
{
    ui->setupUi(this);

    m_stateMachine = new QStateMachine;
}

WizardMainWindow::~WizardMainWindow()
{
    delete ui;
}


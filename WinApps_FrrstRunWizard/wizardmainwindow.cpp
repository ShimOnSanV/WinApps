#include "mainwindow.hpp"
#include "ui_wizardmainwindow.h"
#include <ostream>

WizardMainWindow::WizardMainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::WizardMainWindow)
{
    ui->setupUi(this);

    //MAGIC NUMBER ALERT - fix it
    const int windowsWidth = 1000;
    const int windowsHeight = 600;

    //Get the size of the screen where app is displayed
    //BUG to fix: this the size of the primary screen, nor current screen where app is displayed.
    auto screenGeometry = QGuiApplication::primaryScreen()->geometry();
    std::cerr << "[INFO] Screen Geometry width: " << screenGeometry.x() << std::endl;
    std::cerr << "[INFO] Screen Geometry height: " << screenGeometry.y() << std::endl;

    //Set the size of the Wizzard Main Screen
    //For Develop purposes this size is just fine
    //Maybe size of all elements and the main windows shoud be in ration to the screen?
    this->resize(1000,600); //Orginal ratio 500x300 scalled due to monitor size // currently magix numbers fine for my screen

    int desiredScreenPositionX=(screenGeometry.x() - windowsWidth) / 2;
    int desiredScreenPositionY=(screenGeometry.y() - windowsHeight) / 2;
    this->setGeometry(desiredScreenPositionX,desiredScreenPositionY, windowsWidth, windowsHeight );
    //Linux Mint Bug - window show up on 0,0 point despite the setGeometry
    //QGuiApplication::primaryScreen() // set at the center of screen (what if there a more than one screen?_


    m_stateMachine = new QStateMachine;
}

WizardMainWindow::~WizardMainWindow()
{
    delete ui;
}


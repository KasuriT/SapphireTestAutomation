**Sapphire Test Automation**

A robust and scalable test automation framework designed to streamline quality assurance processes for Sapphire projects. This repository houses a suite of automated tests developed using industry-standard tools and practices.

**Table of Contents**

Overview
Features
Technologies Used
Folder Structure
Setup Instructions
Running Tests
Reporting
Contributing

**Overview**

The SapphireTestAutomation framework is designed to enhance testing efficiency and reliability by automating repetitive and critical test scenarios. It supports integration with CI/CD pipelines, ensuring quality at every stage of development.

**Features**

Modular and reusable test components.
Support for functional, regression, and integration testing.
Seamless CI/CD integration.
Detailed test reporting and logging.
Easily extendable for additional test cases and modules.

**Technologies Used**

Programming Language: [Python, HTML]
Test Framework: [RobotFramework-SeleniumLibraries]
Build Tool: [npm]
Reporting Tool: [Allure]
Other Tools/Technologies: [Jenkins, Git]

**Folder Structure**

SapphireTestAutomation/
├── src/
│   ├── tests/               # Test scripts
│   ├── pages/               # Page Object Models
│   ├── utils/               # Utility functions
├── reports/                 # Test execution reports
├── config/                  # Configuration files
├── README.md                # Project documentation
├── .gitignore               # Git ignore file

**Setup Instructions**

Prerequisites

Install [RobotFramework, Python, RobotFramework- Selenium Libraries, openpyxl, JasonPath].

Clone this repository:
git clone https://github.com/KasuriT/SapphireTestAutomation.git

Installation

Navigate to the project directory:
cd SapphireTestAutomation

Install dependencies:

pip install jsonpath
pip install robertframework
pip install robertframework-seleniumLibrary
pip install openpyxl

**Running Tests**

Execute All Tests 
robot Pages

Run Specific Tests
robot Campaign.robot

**Reporting**

Generated test reports can be found in the reports/ directory. Open the HTML report in your browser:
file:///C:/Users/lenovo/PycharmProjects/SapphireTestAutomation/Pages/report.html

**Contributing**

Contributions are welcome! To contribute:

Fork this repository.

Create a new branch:
git checkout -b feature/new-feature

Commit your changes:
git commit -m "Add new feature"

Push to the branch:
git push origin feature/new-feature

Submit a Pull Request.






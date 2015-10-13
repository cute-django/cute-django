![cute-django](https://avatars3.githubusercontent.com/u/15029184 "cute-django")
===============================================================================

A *QtQuick*-based launcher for *Django*-based apps.

This software is based on:

  * **Django Framework** (for web-app)
  * **PyInstaller** (for deploy of Python code)
  * **Qt Framework** (for launcher)
  * **Qt Installer Framework** (for installer)

## Requirements

 * **Python** >= 2.7
 * **PIP**
 * **virtualenv** (optional)
 * **Qt Framework** >= 5.5
 * **Qt Installer Framework** >= 2.0.1

## Development

The reference site for **cute-django** development is:

https://github.com/cute-django/cute-django

Projects based on **cute-django** are composed by two different components:

 1. a *web-app*;
 2. a *launcher*.

All the business logic should be implemented by the *web-app*,
which is a web server running an application based on **Django Framework**.

The *launcher* is a desktop application based on **Qt Framework**, with
the only purpose to provide access to the web GUI without the need of
using a built-in web-browser (like Chrome, IE, Firefox, etc.).

### Initial step

Some packages need to be installed and configured:

  1.  `pip install virtualenv` (optional)
  2.  `virtualenv env` (optional)
  3.  `source env/bin/activate` (optional)
  4.  `pip install --upgrade -r requirements.txt`

The **virtualenv** is optional, **but is a very good practice: use it!**

### Web App

The **web-app** is simply a normal *Django* project, so the
[official documentation][Django-project] is the best resource to use in order
to understand how to start with it. These are the foundamental steps:

  1.  `django-admin startproject YOURPROJECTNAME`
  2.  Edit `bootstrap.py`
  3.  `python manage.py migrate`
  4.  `python manage.py runserver`

### Launcher

The **launcher** is a Qt-based desktop application:

  1.  Install *Qt Framework*.
  2.  Open `launcher/launcher.pro` through *Qt Creator*.
  3.  Build it.

## Deploy

The web-app based on Django could be packaged in a stand-alone executable file.
This executable will then be executed by the launcher to behave like a fully
desktop executable.

### Prepare components

To achieve the desired result, all the **Python** code should be built using
**PyInstaller**:

 1. `source env/bin/activate` (optional)
 2. `pyinstaller bootstrap.py`

Also the *launcher* should be built in the `./dist` folder. This folder
could then be packaged, ready to be included in the installer executable.

### Create installer

To create the installer executable, the **Qt Installer Framework** will be used.
The following files need to be customized according to the project info:

 * `installer/config/config.xml`
 * `installer/packages/com.project.main/meta/package.xml`

Now the following procedure could be used to build the installer:

 1. `<location-of-qtifw>/archivegen dist.7z dist`
 2. `cp dist.7z installer/packages/com.project.main/data`
 3. `<location-of-qtifw>/binarycreator --offline-only -c installer/config/config.xml -p installer/packages Setup`

For more information, see the [official documentation][QtIF].

## License

The MIT License (MIT)

Copyright (c) 2013 Emanuele Bertoldi

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

[Django-project]: https://docs.djangoproject.com/en/1.8/intro/tutorial01/#creating-a-project
[QtIF]: https://doc.qt.io/qtinstallerframework/index.html

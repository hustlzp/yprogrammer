YProgrammer
===========

http://www.yprogrammer.com

High quality resources, for web programmers.

Deploy:

1. `git clone https://github.com/hustlzp/yprogrammer.git`
2. CD to the project directory, config virtualenv and install packages:
    * `sudo apt-get install python-virtualenv`
    * `virtualenv venv`
    * `. venv/bin/active`
    * `pip install -r requirements.txt`
3. Rename local_settings_sample.py to local_settings.py, and fill up the blank entries in this config file
4. Import data to MySQL:
    * `mysql -uuser -ppassword`
    * mysql> `CREATE DATABASE yprogrammer DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;`
    * `mysql -uuser -ppassword yprogrammer < yprogrammer.sql`
5. `python manage.py runserver`

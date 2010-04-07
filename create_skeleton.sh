#!/bin/sh

echo "Creating necessary directories and placeholder files..."
mkdir db/
chmod -R 755 db/

mkdir templates/
touch templates/404.html
echo "404 Page not Found" > templates/404.html

touch templates/500.html
echo "500 Internal Server Error" > templates/500.html

mkdir -p site_media/css/
touch site_media/css/global.css
echo "/* CSS GOES HERE */" > site_media/css/global.css


mkdir -p site_media/js/
touch site_media/js/global.js
echo "/* JAVASCRIPT GOES HERE */" > site_media/js/global.js

mkdir -p site_media/images/

touch fabfile.py
echo "from fabric.api import run\n\ndef host_type():\n\trun('uname -s')" > fabfile.py

touch README.txt
echo "\n\tREADME\n\t-------------------------\n\n\n\tTASKS\n\t-------------------------
\t- TODO: Make settings.py and urls.py location independent
\t- TODO: Try/catch import local_settings.py at the end of settings.py
\t- TODO: git init; git add .; git commit -a -m \"Commit message here\"" > README.txt

touch local_settings.py
echo "DEBUG = True\nTEMPLATE_DEBUG = DEBUG\nCACHE_BACKEND = \"dummy:///\"" > local_settings.py

touch templates/base.html
echo "{% load i18n %}\n<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.1//EN\"
\t\"http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd\">\n
<html>\n\t<head>\n\t\t<title>{% block title %}{% endblock %}</title>
\t\t{% block extra_head %}{% endblock %}\n\t</head>\n\n<body{% block body_id %}{% endblock %}>\n\t
\t{% block body %}\n\t\t{% block header %}{% endblock %}\n\t\t{% block menu %}{% endblock %}\t\t
\t\t{% block content %}{% endblock %}\n\t\t{% block footer %}{% endblock %}\n\t{% endblock %}\n\t
</body>\n\n</html>" > templates/base.html

if [ -f settings.py ]
then
echo "try:
\tfrom local_settings import *
except ImportError, exp:
\tpass" >> settings.py
fi
echo "....Done!"



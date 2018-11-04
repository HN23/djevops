#!/bin/bash

export project_home=$(find /opt/ -name manage.py -printf '%h\n')

if [ -z "$(ls /opt/conf)" ]; then
  echo "No extra confs supplied"
else
  if [ -d "${project_home}/conf" ]; then
    ls -al /opt/conf
    mv /opt/conf/* "${project_home}/conf"
  else
    settings_py_path=$(find ${project_home} -name settings.py -printf '%h\n')
    echo ${settings_py_path}
    mv /opt/conf/* "${settings_py_path}"
  fi
fi

$project_home/manage.py flush --no-input
$project_home/manage.py migrate
$project_home/manage.py collectstatic --no-input

echo "starting with gunicorn"
cd $project_home
gunicorn $(basename ${project_home}).wsgi:application --bind 0.0.0.0:8000

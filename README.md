# Shitty LAMP stack

GitHub: [https://github.com/GSCloud/shitty_lamp_stack]  

Runs old days LAMP stack for deprecated applications.

## Usage

* **make** -> CLI help

## Install

* run "**make install**"
* use the Apache 2 to run this on a real site through proxying

## Uninstall

* run "**make remove**"
* persistent data remains in the data storage (see below)

## Configuration

* configuration directives for Docker -> **.env**
* extra configuration directives for PHP -> **uploads.ini**

## Data storage

* **Application** storage **./app/**
* **MySQL** database storage **./db/**

Author: Filip Oščádal aka Fred Brooker 💌 <git@gscloud.cz>

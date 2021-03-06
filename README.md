# Shitty LAMP stack

GitHub: [https://github.com/GSCloud/shitty_lamp_stack]  

Run deprecated LAMP stack applications.

## Usage

* **make** -> CLI help

## Install

* run "**make install**" to install minimal set
* run "**make everything**" to install simply everything - for a clean new install incl. extensions
* use the included Apache 2 configuration to run this on a real site through proxying (TLS certificates needed)
* uncomment TLS verification commands if using Authenticated origin pull [https://developers.cloudflare.com/ssl/origin-configuration/authenticated-origin-pull]
* don't forget to run "**a2enmod proxy**" command on the host
* use PMA or Adminer to import MySQL data

## Remove

* run "**make remove**"
* persistent data remains in the data storage (see below)

## Clean

* run "**make clean**"
* removes database storage permanently

## Configuration

* configuration directives for Docker -> **.env**
* extra configuration directives for PHP -> **limits.ini**, **uploads.ini**, **timezone.ini**

## Data storage

* **Application** storage -> **app/**
* **MySQL** database storage -> **db/**

Author: Filip Oščádal aka Fred Brooker 💌 <git@gscloud.cz>

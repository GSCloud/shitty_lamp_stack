# Shitty LAMP stack

GitHub: [https://github.com/GSCloud/shitty_lamp_stack]  

Run deprecated LAMP stack applications.

## Usage

* **make** -> CLI help

## Install

* run "**make install**"
* use the included Apache 2 configuration to run this on a real site through proxying (TLS certificates needed)
* uncomment TLS verification commands if using Authenticated origin pull [https://developers.cloudflare.com/ssl/origin-configuration/authenticated-origin-pull]
* use PMA or Adminer to import MySQL data

## Remove

* run "**make remove**"
* persistent data remains in the data storage (see below)

## Clean

* run "**make clean**"
* removes database storage permanently

## Configuration

* configuration directives for Docker -> **.env**
* extra configuration directives for PHP -> **uploads.ini**

## Data storage

* **Application** storage -> **app/**
* **MySQL** database storage -> **db/**

Author: Filip Oščádal aka Fred Brooker 💌 <git@gscloud.cz>

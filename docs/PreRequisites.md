# PreRequisites
This section will present general knowledge and tools to have before diving into Homestead installation & use. 

***

**Table of Content**

* [What is it?](#what-is-it)

* [Guest Vs Host](#guest-vs-host)

* [Needed Tools](#needed-tools)

* [How Does it Work?](#how-does-it-work)

  * [Provisioning](#provisioning)
  
  * [`after.sh` Script](#after-script)

***

<a id="what-is-it"></a>
# What is it?

The official documentation says:
> Laravel Homestead is an official, pre-packaged Vagrant box that provides you a wonderful development environment without requiring you to install PHP, a web server, and any other server software on your local machine. No more worrying about messing up your operating system! Vagrant boxes are completely disposable. If something goes wrong, you can destroy and re-create the box in minutes!

The official Homestead documentation is available here [https://laravel.com/docs/5.4/homestead](https://laravel.com/docs/5.4/homestead)

<a id="guest-vs-host"></a>
# Guest Vs Host

* a **Host** is hosting virtual machines (guests). It is basically your computer.

* a **Guest** is virtual machine (VM) running on your computer.

<a id="needed-tools"></a>
# Needed Tools

In order to run Homestead, you will need to have the following installed on your host machine:

* VirtualBox: [https://www.virtualbox.org/wiki/Downloads](https://www.virtualbox.org/wiki/Downloads)

* Vagrant: [https://www.vagrantup.com/downloads.html](https://www.vagrantup.com/downloads.html)

* Some coffee ;)

<a id="how-does-it-work"></a>
# How Does it Work?

<a id="provisioning"></a>
## Provisioning

All the files in the `resources/custom` folder will be provisioned in `/tmp` in the VM.
If you need to move them somewhere else, you'll need to update `resources/after.sh` script.

<a id="after-script"></a>
## `After.sh` Script

This script runs just after the VM is up and running. This is where we:
* Install missing dependencies
* Install other packages
* Manipulate custom provisioned files
* and more!

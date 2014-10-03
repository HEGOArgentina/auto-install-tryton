#!/bin/bash
echo Instalación integra de Tryton y modulos para implentar en una distribución Debian Wheezy.
echo Recuerde ingresar las contraseñas apropiadas en los pasos que se soliciten.
echo Inicia sesión como usuario root, ingresá la contraseña.
su - root pwd | cd 
./install_tryton_and_module_ar.sh
exit

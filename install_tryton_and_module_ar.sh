/etc/init.d/postgresql* restart

cd

su - postgres -c "createuser --createdb --no-createrole --no-superuser \
        --pwprompt tryton"

/etc/init.d/tryton-server restart

su - postgres -c "createdb --encoding=UNICODE --owner=tryton tryton"

cd /etc/
rm trytond.conf
git clone https://github.com/HEGOArgentina/trytond-configuracion
cd trytond-configuracion && cp trytond.conf /etc/

/usr/bin/trytond -i all -d tryton
/usr/bin/trytond -u all -d tryton

############################
# Instalación del Patch de login

cd /usr/lib/python2.7/dist-packages/tryton/
git clone https://github.com/HEGOArgentina/patch-login-tryton

cd /usr/lib/python2.7/dist-packages/tryton/patch-login-tryton
cp -R common.py /usr/share/pyshared/tryton/common/common.py 
cp -R dbcreate.py /usr/share/pyshared/tryton/gui/window/dbcreate.py
cp -R dblogin.py /usr/share/pyshared/tryton/gui/window/dblogin.py
/etc/init.d/tryton-server restart

############################
# Instalación de Módulos para Argentina

cd /usr/lib/python2.7/dist-packages/trytond/modules/
git clone https://github.com/HEGOArgentina/11-modulos-ar.git

cp -r /usr/lib/python2.7/dist-packages/trytond/modules/11-modulos-ar/account_ar /usr/lib/python2.7/dist-packages/trytond/modules/
cp -r /usr/lib/python2.7/dist-packages/trytond/modules/11-modulos-ar/account_bank_ar /usr/lib/python2.7/dist-packages/trytond/modules/
cp -r /usr/lib/python2.7/dist-packages/trytond/modules/11-modulos-ar/account_check_ar /usr/lib/python2.7/dist-packages/trytond/modules/
cp -r /usr/lib/python2.7/dist-packages/trytond/modules/11-modulos-ar/account_coop_ar /usr/lib/python2.7/dist-packages/trytond/modules/
cp -r /usr/lib/python2.7/dist-packages/trytond/modules/11-modulos-ar/account_fiscalprinter_ar /usr/lib/python2.7/dist-packages/trytond/modules/
cp -r /usr/lib/python2.7/dist-packages/trytond/modules/11-modulos-ar/account_invoice_ar /usr/lib/python2.7/dist-packages/trytond/modules/
cp -r /usr/lib/python2.7/dist-packages/trytond/modules/11-modulos-ar/account_retencion_ar /usr/lib/python2.7/dist-packages/trytond/modules/
cp -r /usr/lib/python2.7/dist-packages/trytond/modules/11-modulos-ar/account_voucher_ar /usr/lib/python2.7/dist-packages/trytond/modules/
cp -r /usr/lib/python2.7/dist-packages/trytond/modules/11-modulos-ar/company_logo /usr/lib/python2.7/dist-packages/trytond/modules/
cp -r /usr/lib/python2.7/dist-packages/trytond/modules/11-modulos-ar/cooperative_ar /usr/lib/python2.7/dist-packages/trytond/modules/
cp -r /usr/lib/python2.7/dist-packages/trytond/modules/11-modulos-ar/country_ar /usr/lib/python2.7/dist-packages/trytond/modules/

rm -r /usr/lib/python2.7/dist-packages/trytond/modules/11-modulos-ar

############################
# Reiniciamos Los Servidores de Postgre y Tryton

/etc/init.d/postgresql* restart
/etc/init.d/tryton-server restart

############################

exit

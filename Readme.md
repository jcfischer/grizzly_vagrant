Installation eines Basis Setups für die /ch/open Workshoptage
=============================================================

Voraussetzungen
---------------

Laptop mit möglichst viel Memory (wir werden 3 virtuelle Maschinen installieren). 
4 GB "sollten" reichen...

Software:

  * Virtualbox: http://virtualbox.org
  * Vagrant: http://vagrantup.com

Vorbereitung
------------

Dieses Repository clonen oder downloaden, dann

    vagrant up

um die 3 virtuellen Maschinen zu starten. Der erste Start wird einige (also eigentlich ganz viele) Minuten dauern,
da zuerst das Basis-Image heruntergeladen werden muss und sämtliche Komponenente von OpenStack installiert
(aber noch nicht konfiguriert werden)

Umgang
------

Sie könenn via

    vagrant ssh controller
    vagrant ssh netnode
    vagrant ssh compute1

in die verschiedenen VMs 'sshen'

Wir werden im Workshop die Konfiguration der Cloud fertigstellen


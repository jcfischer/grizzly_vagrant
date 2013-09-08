Installation eines Basis Setups für die /ch/open Workshoptage
=============================================================

Voraussetzungen
---------------

Laptop mit möglichst viel Memory (wir werden 3 virtuelle Maschinen installieren). Die VMs
benötigen etwas 2.2 GB Speicher, daher sollten 4 GB reichen...

Die installierten Imagen benötigen knapp 10 GB Speicherplatz auf der Festplatte.

Software:

  * Virtualbox: http://virtualbox.org
  * Vagrant: http://vagrantup.com (getestet Version 1.2.7)
  * PuTTY (nur unter Windows): http://www.chiark.greenend.org.uk/~sgtatham/putty/

Die Software steht unter Windows, Mac und Linux zur Verfügung.

Vorbereitung
------------

Dieses Repository clonen oder downloaden und dann Vagrant starten:

Mit git:

    git clone https://github.com/jcfischer/grizzly_vagrant.git
    cd grizzly_vagrant
    vagrant up

via download:

* Herunterladen von [master.zip](https://github.com/jcfischer/grizzly_vagrant/archive/master.zip)
* auspacken
* in einem Terminalfenster (cmd.exe) in dieses Verzeichnis wechseln
* `vagrant up` ausführen


um die 3 virtuellen Maschinen zu starten. Der erste Start wird einige (also eigentlich ganz viele) Minuten dauern,
da zuerst das Basis-Image heruntergeladen werden muss und sämtliche Komponenente von OpenStack installiert
(aber noch nicht konfiguriert werden)

Probleme
--------

Wir haben Fälle gesehen, bei denen die VMs nicht korrekt gebaut werden - bei der zweiten Instanz bricht der
Befehl `vagrant up` ab.

Hier ein Workaround, der bei unseren Tests funktioniert hat:

    $ vagrant up    # Es wird versucht alle VMs zu starten, bei der zweiten VM kommt eine Fehlermeldung

Im Virtualbox UI die "tote" VM löschen und alle Daten entfernen

    $ vagrant up netnode   # die dritte der VMs bauen
    $ vagrant up compute1  # die zweite VM bauen

Jetzt sollten alle VMs laufen

    $ vagrant status


Wenn Sie soweit gekommen sind, ist alles klar für den Kurs. Falls das nicht klappt, nehmen Sie bitte bis
spätestens Montag, 9.9 Vormittag Kontakt mit mir auf (jens-christian.fischer (at) switch.ch) Ich werde
dann einen konfigurierten Laptop für Sie mitbringen (und Nein, es hat nicht genug Laptops für alle, und die
Geräte sind auch nicht sehr leistungsfähig - es lohnt sich also, ihren High-End Rechner zu verwenden :)

Umgang
------

Sie könenn via

    vagrant ssh controller
    vagrant ssh netnode
    vagrant ssh compute1

in die verschiedenen VMs 'sshen'.

Unter Windows gibt Ihnen der `vagrant ssh` Befehl die nötigen Parameter, damit Sie sich via PuTTY verbinden können.

Via `vagrant ssh-config` bekommen Sie die Konfigurationsdaten für SSH.

Cloud Installation
------------------

Wir werden im Workshop die Konfiguration der Cloud fertigstellen. Bitte stellen Sie sicher, dass Sie die
drei VMs installiert haben, und dass Sie via ssh auf die virtuellen Maschinen zugreifen können.

Bei Fragen stehe ich Ihnen per EMail zur Verfügung: `jens-christian (at) invisible.ch`


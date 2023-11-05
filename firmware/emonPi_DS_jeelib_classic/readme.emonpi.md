# Aggiornamento firmware emonPi
## Step 1 - Firmware
1. Installare PlatformIO come estensione di VS Code (se non già presente).
1. Con VS Code apire la cartella contenente i sorgenti.
1. Modificare i file .ino.
    1. Apportare le modifiche volute.
    1. Nel file `main.ino` trasformare la variabile `firmware_version` da `const int firmware_version = ` a `const char firmware_version[] PROGMEM = ...`. Questo per poter aggiungere una quarta cifra alla versione (es. da `2.9.3` a `2.9.3.1`) così da mantenere la versione originale ed identificare la propria.
    1. Modificare i file del progetto che utilizzano la variabile `firmware_version`.
1. Per compilare il progetto dall'activity bar di VS Code selezionare PlatformIO, cercare il task `emonpi\General\Build` ed eseguirlo.
1. Spostare il file `.pio/build/emonpi/firmware.hex` nella cartella (crearla se necessario) `release/firmware_VX.x.x.x.hex`.
1. Per semplificare il passaggio del file .hex sul raspberry committare e fare il push del progetto su github.

## Step 2 - Raspberry
1. Con putty collegarsi al raspberry.
1. Verificare che esistano i seguenti file
    1. `/opt/openenergymonitor/emonpi/update/emonpi.sh`.
    1. `/opt/openenergymonitor/EmonScripts/update/avrdude.conf`.
1. Posizionarsi nella cartella `/opt/openenergymonitor/emonpi/firmware/emonPi_DS_jeelib_classic/`.
1. Copiare il file per aggiornare il firmware: `cp /opt/openenergymonitor/emonpi/update/emonpi.sh ./emonpi.sh`.
1. Scaricare il nuovo firmware: `wget <url><nomefile.hex>`.
    1. Utilizzando l'interfaccia web di gitub cercare il file compilato nel precedente step.
    1. Copiare l'url che inizia per `https://raw.githubusercontent.com/...` e che permette di scaricare il raw del file.
    1. Rinominare il file `mv <nomefile.hex> latest.hex`.
1. Modificare il file `nano emonpi.sh` sostituendo con quanto presente in questa cartella.
1. Eseguire lo script: `sh emonpi.sh`.  
**N.B.: E' possibile che sia necessario eseguire più volte lo script affinché funzioni.**
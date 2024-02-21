# DS

## Clonar repositorio
- Se puede hacer directamente en Visual Studio Code en la opción a la izquierda "Source Control". Clicar en Clone Repository, introducir usuario y contraseña de Git y ya eliges que repo clonar. Por último, hay que elegir en que carpeta clonar el repositorio remoto y será el directorio desde donde se podrán ejecutar comandos de git.
- Otra opción es crear una carpeta donde se quieran tener las prácticas y una vez situado dentro de la carpeta, ejecutar `git clone git@github.com:rn2k00/DS-P1.git`, luego ejecutas `git code` y se te abre Visual Studio.

## Cambiar de rama
Lo suyo sería que cada uno se creara una rama y trabaje ahi, así se puede subir los cambios a la rama remota propia y cuando consideremos oportuno mergear con la rama main que ya está creada. 
- Crear una rama:
  - Desde gitHub.
  - Desde Visual Studio: abajo a la izquierda aparece un simbolo y al lado el nombre de la rama en la que estás, clicando se puede crear una nueva rama.
  - Desde la terminal: `git branch nombre_rama`
- Cambiar de rama:
  - Desde Visual Studio: igual que crearla, clicando te da la opcion de cambiarte de rama.
  - Desde la terminal: `git checkout nombre_rama`
 
## Descargar los cambios que haya en el repo remoto
Ejecutando el comando `git pull` descargamos todo lo nuevo que haya en el repo, como cada uno tiene su rama el trabajo de cada uno no se solapa.

## Subir los cambios al repo remoto
Ejecutando el comando `git push` se envian los cambios de tu rama local a la rama remota 

Ambos comandos anteriores se puede hacer en Visual Studio navegando por el "Source Control".

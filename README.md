# Configure PHP In Debian GNU/Linux

## Uso:
```bash
    git clone https://github.com/alexus21/ConfigurePhpInDebian.git
    cd ConfigurePhpInDebian/
    chmod +x script.sh
    ./script.sh
```

## Nota:
Si no tienes sudo instalado, ejecuta lo siguiente:
```bash
    su -
    apt install sudo
```

Ahora, agrega tu usuario al grupo sudo:
```bash
    usermod -aG sudo <tu_usuario>
```

Después de eso, cierra la sesión y vuelve a iniciarla. O reinicia tu computadora. Ambas opciones son válidas.

# Starting Scripts
Starting scripts for a Spigot / Bukkit / ... Server or a BungeeCord Server.


### IMPORTANT
- for Linux only!
- **screen** needs to be installed. (see _Screen installation_)

## Screen installation
### Debian / Ubuntu / Linux Mint
```sudo apt install screen```
### CentOS 7
```sudo yum install screen```

## BungeeCord file installation
1. Put the **startBungee.sh** file into your BungeeCord server folder. (Rename it if you want to)
2. Open the file and change **"SERVER"** to your BungeeCord.jar file name if needed. Change **"SCREENNAME"** to the name you want.
3. Change **"HOME"** to the directory, where the BungeeCord.jar file is.
4. Set **"HEAP_MAX"** to the maximum amount of RAM you will give the server and **"HEAP_MIN"** to the minimum amount.
5. That's it, for more settings you can also change the other parameters.

## Spigot / Bukkit / ... file installation
1. Put the **startServer.sh** file into your Minecraft server folder. (Rename it if you want to)
2. Open the file and change **"SERVER"** to your spigot.jar file name if needed. Change **"SCREENNAME"** to the name you want.
3. Change **"HOME"** to the directory, where the spigot.jar file is.
4. Set **"MAX_RAM"** to the maximum amount of RAM you will give the server and **"MIN_RAM"** to the minimum amount.
5. That's it, for more settings you can also change the other parameters.

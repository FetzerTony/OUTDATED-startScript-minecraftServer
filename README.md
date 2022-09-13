# Starting Scripts
Starting scripts for a Spigot / Bukkit / ... Server or a BungeeCord Server.


### :no_entry: IMPORTANT
- for Linux only!
- **screen** needs to be installed. (see _Screen installation_)

## :wrench: Screen installation
### Debian / Ubuntu / Linux Mint
```sudo apt install screen```
### CentOS 7
```sudo yum install screen```

## :hammer_and_wrench: BungeeCord file installation
1. Put the **startBungee.sh** file into your BungeeCord server folder. (Rename it if you want to)
2. Open the file and change **"SERVER"** to your BungeeCord.jar file name if needed. Change **"SCREENNAME"** to the name you want.
3. Change **"HOME"** to the directory, where the BungeeCord.jar file is.
4. Set **"HEAP_MAX"** to the maximum amount of RAM you will give the server and **"HEAP_MIN"** to the minimum amount.
5. Type `chmod 777 startBungee.sh` in the server console.
6. That's it, for more settings you can also change the other parameters.

## :hammer_and_wrench: Spigot / Bukkit / ... file installation
1. Put the **startServer.sh** file into your Minecraft server folder. (Rename it if you want to)
2. Open the file and change **"SERVER"** to your spigot.jar file name if needed. Change **"SCREENNAME"** to the name you want.
3. Change **"HOME"** to the directory, where the spigot.jar file is.
4. Set **"MAX_RAM"** to the maximum amount of RAM you will give the server and **"MIN_RAM"** to the minimum amount.
5. Type `chmod 777 startServer.sh` in the server console.
6. That's it, for more settings you can also change the other parameters.

## :star: starting commands
1. Go to the folder where the startup file is located. ```cd /<directory>```

### Commands
- You can select between this options: ***start, stop, restart, view***

  - **start**: Starts the server. ```./startServer.sh start``` or ```./startBungee.sh start```
  - **stop**: Stops the server. ```./startServer.sh stop``` or ```./startBungee.sh stop```
  - **restart**: Restarts the server. ```./startServer.sh restart``` or ```./startBungee.sh restart```
  - **view**: Opens the console. ```./startServer.sh view``` or ```./startBungee.sh view```

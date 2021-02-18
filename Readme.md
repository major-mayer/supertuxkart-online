# SuperTuxKart Online Server as a Docker-Container 
This is a simple Docker container to start a online (WAN) SuperTuxKart server.
My goal is to keep it as simple as possible, but it still needs a bit of configuring.
It supports **AI controlled karts** out of the box as a extra feature. 

## Volumes
| Host                | Container                                                    |
|---------------------|--------------------------------------------------------------|
| ./server_config.xml | /home/stk/.config/supertuxkart/config-0.10/server_config.xml |

Note: It is very important that the server config file is owned by the stk user, otherwise it can't be accessed in the container. So simply execute `chown 1000:1000 server_config.xml`.

## Environment variables
I suppose that you want to want to see your server in the STK Server Browser, so the container needs your account details to be able to register the new server.

| Key          | Value                                                                                                                                |
|--------------|--------------------------------------------------------------------------------------------------------------------------------------|
| stk_user     | Your SuperTuxKart online username for the server                                                                                             |
| stk_pw       | Your SuperTuxKart online password for the server                                                                                                   |
| stk_serverpw | **Optional** If you have set a server password in the server_config.xml the script needs to know it to be able to connect with the AI karts to it |
| stk_aikarts | **Optional** Sets the number of AI karts on this server (Take about 3 less than your max server capacity, otherwise it will somehow not work)|


## Ports
You don't need to open any port to make this server running because it makes use of STKs own stun techniques.
HOWEVER: If you are relying on this behaviour, the server connection gets closed after a few hours! 
So to keep the server permanently online you have to open port 2759 and edit this section in the config file:
``` xml
<!-- Disable it to turn off all stun related code in server, it allows for saving of server resources if your server is not behind a firewall. -->
<firewalled-server value="false" />
``` 


If you want to connect directly to the server over LAN you have to open the port 2759 and 2757 (for service discovery), but only on your local server, not on the router. 

## Troubleshooting
- When you restart the server/container, you have to wait about 10 seconds. Otherwise the SuperTuxKart online servers are still thinking that the server exists and the new session cannot be started.
## Thanks to 
[OpenHS](https://github.com/openhs/docker-supertuxkart-server) for his great base Dockerfile that I extended a bit.

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
| stk_user     | Your SuperTuxKart online username                                                                                                    |
| stk_pw       | Your SuperTuxKart online password                                                                                                    |
| stk_serverpw | **Optional** If you have set a server password in the server_config.xml the script needs to know it to be able to connect with the AI karts to it |
| stk_aikarts | **Optional** Sets the number of AI karts on this server|

## Troubleshooting
- Sometimes the server just doesn't start when you try it the first time, but exits instantly. In this case you just have to stop the Docker container and start it after a few seconds. I would be glad if somebody could help me finding the error for this.
## Thanks to 
[OpenHS](https://github.com/openhs/docker-supertuxkart-server) for his great base Dockerfile that I extended a bit.
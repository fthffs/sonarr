## Rootless Sonarr 🚀  
- #### Built straight from the latest [Sonarr release](https://github.com/Sonarr/Sonarr/releases) 📚. 
- #### The difference between this image and others is that this runs as an *unprivileged user*, using a uid (1000) and gid (1000) 👥. 

## Why run as an unprivileged user? 🔒  
- Running Sonarr as an unprivileged user helps to: 
  - Reduce the attack surface of your container 
  - (Possibly) Prevent potential security vulnerabilities in case of a compromise 🤖     

## Usage 📁  
- This image can be used in the same way as any other Docker Sonarr image. Simply pull and run it using Docker, make sure the volumes mounted are owned by 1000:1000 (likely your user) 🔄.

**Example docker-compose.yml**
```docker-compose.yml
  sonarr:
    image: fthffs/sonarr:4.0.10.2656
    container_name: sonarr
    environment:
      - TZ=Europe/Stockholm
    volumes:
      - /containers/torrents/sonarr:/config
      - /data/media/tv:/data/media/tv
      - /data/torrents/tv:/data/torrents/tv
    restart: unless-stopped
``` 

[Sonarr wiki](https://wiki.servarr.com/sonarr)

[Trash Guides](https://trash-guides.info/Sonarr/)

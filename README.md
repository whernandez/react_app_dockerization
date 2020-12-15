React App Dockerization
=======================

##### Requirements
1. Install Docker: https://docs.docker.com/get-docker/

2. Install Docker Compose: https://docs.docker.com/compose/install/

3. Install Traefik: https://hub.docker.com/_/traefik
    ```bash
        $ docker pull traefik
    ```

4. Set docker-compose.yml with your setup

##### Run React App  

1. Clone this repository

    ```bash
        $ git clone https://github.com/whernandez/react_app_dockerization.git
    ```

2. Copy .env.sample to .env and set the app values
    
3. Start the build
        - Create react app and make the build in development mode
            ```bash
                $ make build-install
            ```

    - For Development build
        ```bash
            $ make build-start
        ```

    - For Production build
        ```bash
            $ make build-prod
        ```
	
4. The build.sh file will prepare the image with your setup

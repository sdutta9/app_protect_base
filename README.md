# app_protect_base
This repo contains resources for Nginx App Protect demos which can be easily deployed to Docker.

**NOTE:** All App Protect related configurations are applied to the `http` context present inside the `nginx.conf` file for all the branches. 

This repo has **four** branches which can be used for different demos as described below:

- **main:** <br>
  This branch can be used to demonstrate basic configuration to enable App Protect. The `Dockerfile` within `nginx-plus` directory has steps to install App Protect.
  
- **main_with_ST:** <br>
  This branch is based of `main` branch and can be used to demostrate how `Attack Signatures` and `Threat campaigns` can be updated. <br>
  The `Dockerfile` within `nginx-plus` directory for this branch has steps to install `Attack Signatures` and `Threat campaigns` packages. <br>
  You can test the installation of this packages by getting inside the `nginx-plus` container and then running the below commands:
  ```bash
  docker exec -it [containerID] bash

  #Within the container run below commands:
  apt list --installed| grep app-protect

  apt-cache policy app-protect-attack-signatures

  apt-cache policy app-protect-threat-campaigns  
  ```

- **advance:** <br>
  This branch is based on `main` branch. This branch can be used to demonstrate custom `log-format` and custom `policy` in context to App Protect. <br>
  Toggle between various commented `policy` lines within `nginx.conf` to cover various scenarios. <br>
  Within this branch, App Protect related policies are also applied to `\basic` location block present inside the `conf.d\example.com.conf` file along with `http` context present inside the `nginx.conf` file.

- **advance_elk:** <br>
  This branch is based on `advance` branch. This branch can be used to demostrate how App Protect logs can be streamed to an elasticsearch server and then consolidate logs can be viewed within Kibana dashboard. <br>
  The `docker-compose` file within this branch adds `elk` service which is used for Kibana dashboards. <br>
  The Kibana dashboard can be accessed using [http:\\localhost:5601](http://localhost:5601/)
# NGINX App Protect Demo

## Overview

This repository contains resources that can be used to demo Nginx App Protect within a Docker environment.

**NOTE:** All App Protect related configurations are applied to the `http` context present inside the `nginx.conf` file for all the branches. 

## Guide

This repo has **four** "distinct" branches which can be used for different demos as described below.

**NOTE:** All App Protect related configurations are applied to the `http` context present inside the `nginx.conf` file for all the branches.

### ***main* Branch** 
- This branch can be used to demonstrate basic configuration to enable App Protect. 
- The `Dockerfile` within `nginx-plus` directory has steps to install App Protect.
  
### ***main_with_ST* Branch**
- This branch is based of `main` branch and can be used to demostrate how `Attack Signatures` and `Threat campaigns` can be updated.
- The `Dockerfile` within `nginx-plus` directory for this branch has steps to install `Attack Signatures` and `Threat campaigns` packages.
- You can test the installation of this packages by getting inside the `nginx-plus` container and then running the below commands:
  ```bash
  docker exec -it [containerID] bash

  #Within the container run below commands:
  apt list --installed| grep app-protect

  apt-cache policy app-protect-attack-signatures

  apt-cache policy app-protect-threat-campaigns  
  ```

### ***advance* Branch**
- This branch is based on `main` branch. This branch can be used to demonstrate custom `log-format` and custom `policy` in context to App Protect.
- Toggle between various commented `policy` lines within `nginx.conf` to cover various scenarios.
- Within this branch, App Protect related policies are also applied to `\basic` location block present inside the `conf.d\example.com.conf` file along with `http` context present inside the `nginx.conf` file.

### ***advance_elk* Branch**
- This branch is based on `advance` branch. This branch can be used to demostrate how App Protect logs can be streamed to an elasticsearch server and then consolidate logs can be viewed within Kibana dashboard.
- The `docker-compose` file within this branch adds `elk` service which is used for Kibana dashboards.
- The Kibana dashboard can be accessed using [http://localhost:5601](http://localhost:5601/)

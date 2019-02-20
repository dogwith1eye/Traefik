#!/bin/bash
chmod +x ./traefik.toml
dos2unix ./traefik.toml
chmod +x ./deploy-envs.sh
dos2unix ./deploy-envs.sh
chmod +x ./scripts/build.sh
dos2unix ./scripts/build.sh
cd scripts && ./build.sh
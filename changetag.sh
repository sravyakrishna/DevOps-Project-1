#!/bin/bash
sed "s/tagversion/$1/g" pods.yaml > node-app-pod.yaml

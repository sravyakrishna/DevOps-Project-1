#!/bin/bash
sed "s/tagversion/$1/g" pods.yaml > shiva-app-pod.yaml

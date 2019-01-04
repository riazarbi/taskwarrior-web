# Taskwarrior-Web in a Docker Container

This is a super simple image based on alpine 3.5 that runs taskwarrior-web on port 5678.

## Sample Docker Run With Sync Server 

```
docker run -d \
  --name=taskwarrior-web \
  -p 5678:5678 \
  -v ~/task-web:/root/.task \
  -e TASKD_SERVER='trident.hav0k.ru:53589' \
  -e TASKD_CREDENTIALS='AlphaV/Alexey Vildyaev/3e382537-d7d9-4677-8311-3cfd1047623f' \
  f2a1c74860ae
```

## Sample Docker Run Without Sync Server 

```
docker run -d \
  --name=taskwarrior-web \
  -p 5678:5678 \
  -v ~/task-web:/root/.task \
  469dc4db0eef
```

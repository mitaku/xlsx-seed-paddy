# xlsx-seed-paddy

xlsx => yml

```
docker run --rm -e GLOB_TEXT=src/*.xlsx -e VERSION=2020.3.25 -e DATA_START_ROW=3 -v ${PWD}/src:/opt/node_app/app/src/ -v ${PWD}/dist:/opt/node_app/app/dist/ bluemage1104/xlsx-seed-paddy:latest
```
# Flutter-Clean-Architecture
Um projeto resultado das aulas de Clean Architecture do Flutterando
- [Playlist das aulas do flutterando](https://www.youtube.com/playlist?list=PLyg2GX9I1ah6R0C2LOwmTsjjojk_UTnIA)

## Como testar
- flutter test

## Estrutura do projeto
```
lib
    - modules
        - [module-name]
            - domain
                - entities
                - repositories
                - usecases
            - errors
            - external
                - datasources
            - infra
                - datasources
                - models
                - repositories
            - presenter
                - [module-name]
                    - states
```
# bolt_themes_static_pages
A repository to host static version of websites demonstrating Bolt CMS themes


## (Re)Install Bolt CMS

```
php composer.phar update
php app/nut cache:clear
php app/nut database:update
```

## Run the server

```
php app/nut server:run
```

## Update submodules (our themes)

```
git submodule update --recursive --remote
```

# bolt_themes_static_pages
A repository to host static websites to demonstrate my Bolt CMS themes.


## Setup

__(Re)Install Bolt CMS__
```
php composer.phar update
php app/nut cache:clear
php app/nut database:update
```
__after initial git pull__
```
git submodule update --init --recursive
```
__Update submodules (our themes)__
```
git submodule update --recursive --remote
```



## Build static site with wget
__run the Bolt-server__
```
php app/nut server:run
```

__on other terminal: create the static mirror site inside of the tmp-directory__
```
make mirror_to_tmp
```
This calls wget and creates a mirror inside of `/tmp`. We assume our Bolt server is reachable at `0.0.0.0:8000`!  
Since wget does rename some `jpg` to `jpgg` inside if `srcset` for unknown reasons we need to rerename them...  
Wget also does not copy resources specified by untypical attributes, since the gpx-feature uses such an attribute to define the gpx-file we need to copy this file by hand!  
All this is done inside of `make mirror_to_tmp`.

__preview mirror inside tmp__
```
make serve_tmp
```
To quickcheck if mirroring was successful we can start a simple webserver!


__copy to `docs` directory__

When your mirror looks fine it can be copied to its own subdir inside of the `docs` directory.  
```
make use_tmp_as_hyde_for_bolt_mirror
```
The `docs`-dir will be be published using github-pages.

BOLTURL := 0.0.0.0:8000

mirror_to_tmp: clean_tmp
	wget -mkEpnp -P ./tmp/ $(BOLTURL)
	grep -rl 'jpgg' ./tmp | xargs sed -i '' -e 's/jpgg/jpg/g'
	cp -r bolt/public/files/tracks tmp/$(BOLTURL)/files/
	grep -rl 'tracks' ./tmp | xargs sed -i '' -e 's/\/files\/tracks/\.\.\/files\/tracks/g'

clean_tmp:
	rm -rf tmp/*

serve_tmp:
	php -S localhost:8001 -t tmp/$(BOLTURL)

use_tmp_as_hyde_for_bolt_mirror:
	rm -rf docs/hyde-for-bolt
	cp -r tmp/$(BOLTURL) docs/hyde-for-bolt

serve_bolt:
	php bolt/app/nut server:run

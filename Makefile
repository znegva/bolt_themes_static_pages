mirror_to_tmp: clean_tmp
	wget -mkEpnp -P ./tmp/ http://0.0.0.0:8000
	grep -rl 'jpgg' ./tmp | xargs sed -i '' -e 's/jpgg/jpg/g'
	cp -r bolt/public/files/2018-11 tmp/0.0.0.0:8000/files/

clean_tmp:
	rm -rf tmp/*

serve_tmp:
	php -S localhost:8001 -t tmp/0.0.0.0:8000

clean:
	rm -rf crx-quickstart snapshot

start:
	java -server -Xms1024M -jar `ls *.jar` -p 4502 -r author,nosamplecontent

snapshot:
	mkdir -p snapshot
	cp -R crx-quickstart/* snapshot

restore:
	rm -rf crx-quickstart/*
	cp -R snapshot/* crx-quickstart

.PHONY: clean start snapshot restore

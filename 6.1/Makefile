clean:
	rm -rf crx-quickstart snapshot

start:
	java -XX:MaxPermSize=256m -Xms1024M -jar `find . | grep jar` -p 4502

snapshot:
	mkdir -p snapshot
	cp -R crx-quickstart/* snapshot

restore:
	rm -rf crx-quickstart/*
	cp -R snapshot/* crx-quickstart

.PHONY: clean start snapshot restore

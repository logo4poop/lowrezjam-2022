build:
	haxelib run lime test html5 --connect 6000
server:
	haxe --server-listen 6000 &
	browser-sync start --server ./export/html5/bin --files ./export/html5/bin 

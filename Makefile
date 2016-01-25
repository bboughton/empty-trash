install:
	@mkdir -p /usr/local/opt/empty-trash/{bin,logs}
	@cp empty-trash.sh /usr/local/opt/empty-trash/bin/empty-trash.sh
	@cp com.github.bboughton.empty-trash.plist /usr/local/opt/empty-trash/com.github.bboughton.empty-trash.plist
	@launchctl load /usr/local/opt/empty-trash/com.github.bboughton.empty-trash.plist
	@launchctl start com.github.bboughton.empty-trash

uninstall:
	@-launchctl unload /usr/local/opt/empty-trash/com.github.bboughton.empty-trash.plist
	@-$(RM) /usr/local/opt/empty-trash/com.github.bboughton.empty-trash.plist
	@-$(RM) /usr/local/opt/empty-trash/bin/empty-trash.sh
	@-$(RM) /usr/local/opt/empty-trash/logs/empty-trash.log
	@-rmdir /usr/local/opt/empty-trash/{bin,logs}
	@-rmdir /usr/local/opt/empty-trash

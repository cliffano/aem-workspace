define aem_init
  mkdir -p \
	  workspaces/$(1)/author/backup \
		workspaces/$(1)/publish/backup
endef

define aem_clean
  rm -rf workspaces/$(1)/$(2)/
endef

define aem_start
  cd workspaces/$(1)/$(2)/ && \
	  cp ../../../artifacts/license-$(1).properties license.properties && \
	  java -server -Xms1024M -jar ../../../artifacts/$(4) -p $(3) -nointeractive -r $(2),nosamplecontent
endef

define aem_backup
  cd workspaces/$(1)/$(2)/ && \
	  cp -R crx-quickstart/* backup/
endef

define aem_restore
  cd workspaces/$(1)/$(2)/ && \
	  rm -rf crx-quickstart/* && \
	  cp -R backup/* crx-quickstart/
endef

aem62-init:
	$(call aem_init,aem62)

aem62-clean-author:
	$(call aem_clean,aem62,author)

aem62-clean-publish:
	$(call aem_clean,aem62,publish)

aem62-start-author: aem62-init
	$(call aem_start,aem62,author,45622,AEM_6.2_Quickstart.jar)

aem62-start-publish: aem62-init
	$(call aem_start,aem62,publish,45623,AEM_6.2_Quickstart.jar)

aem62-backup-author: aem62-init
	$(call aem_backup,aem62,author)

aem62-backup-publish: aem62-init
	$(call aem_backup,aem62,publish)

aem62-restore-author: aem62-init
	$(call aem_restore,aem62,author)

aem62-restore-publish: aem62-init
	$(call aem_restore,aem62,publish)

aem63-init:
	$(call aem_init,aem63)

aem63-clean-author:
	$(call aem_clean,aem63,author)

aem63-clean-publish:
	$(call aem_clean,aem63,publish)

aem63-start-author: aem63-init
	$(call aem_start,aem63,author,45632,AEM_6.3_Quickstart.jar)

aem63-start-publish: aem63-init
	$(call aem_start,aem63,publish,45633,AEM_6.3_Quickstart.jar)

aem63-backup-author: aem63-init
	$(call aem_backup,aem63,author)

aem63-backup-publish: aem63-init
	$(call aem_backup,aem63,publish)

aem63-restore-author: aem63-init
	$(call aem_restore,aem63,author)

aem63-restore-publish: aem63-init
	$(call aem_restore,aem63,publish)

aem64-init:
	$(call aem_init,aem64)

aem64-clean-author:
	$(call aem_clean,aem64,author)

aem64-clean-publish:
	$(call aem_clean,aem64,publish)

aem64-start-author: aem64-init
	$(call aem_start,aem64,author,45642,AEM_6.4_Quickstart.jar)

aem64-start-publish: aem64-init
	$(call aem_start,aem64,publish,45643,AEM_6.4_Quickstart.jar)

aem64-backup-author: aem64-init
	$(call aem_backup,aem64,author)

aem64-backup-publish: aem64-init
	$(call aem_backup,aem64,publish)

aem64-restore-author: aem64-init
	$(call aem_restore,aem64,author)

aem64-restore-publish: aem64-init
	$(call aem_restore,aem64,publish)

clean:
	rm -rf workspace/

.PHONY: clean

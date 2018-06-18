define aem_init
  mkdir -p \
	  workspaces/$(1)/author/backup \
		workspaces/$(1)/publish/backup
endef

define aem_start_author
  cd workspaces/$(1)/author/ && \
	  cp ../../../artifacts/license-$(1).properties license.properties && \
	  java -server -Xms1024M -jar ../../../artifacts/$(2) -p 4502 -nointeractive -r author,nosamplecontent
endef

define aem_start_publish
  cd workspaces/$(1)/publish/ && \
	  java -server -Xms1024M -jar ../../../artifacts/$(2) -p 4503 -nointeractive -r publish,nosamplecontent
endef

define aem_backup_author
  cd workspaces/$(1)/author/ && \
	  cp -R crx-quickstart/* backup/
endef

define aem_backup_publish
  cd workspaces/$(1)/publish/ && \
	  cp -R crx-quickstart/* publish/
endef

define aem_restore_author
  cd workspaces/$(1)/author/ && \
	  rm -rf crx-quickstart/* && \
	  cp -R backup/* crx-quickstart/
endef

aem62-init:
	$(call aem_init,aem62)

aem62-start-author: aem62-init
	$(call aem_start_author,aem62,AEM_6.2_Quickstart.jar)

aem62-backup-author: aem62-init
	$(call aem_backup_author,aem62)

aem62-restore-author: aem62-init
	$(call aem_restore_author,aem62)

aem63-init:
	$(call aem_init,aem63)

aem63-start-author: aem63-init
	$(call aem_start_author,aem63,AEM_6.3_Quickstart.jar)

aem63-backup-author: aem63-init
	$(call aem_backup_author,aem63)

aem63-restore-author: aem63-init
	$(call aem_restore_author,aem63)

aem64-init:
	$(call aem_init,aem64)

aem64-start-author: aem64-init
	$(call aem_start_author,aem64,AEM_6.4_Quickstart.jar)

aem64-backup-author: aem64-init
	$(call aem_backup_author,aem64)

aem64-restore-author: aem64-init
	$(call aem_restore_author,aem64)

clean:
	rm -rf workspace/

.PHONY: clean

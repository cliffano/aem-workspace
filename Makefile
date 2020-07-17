ci: clean aem62-init aem62-clean-author aem62-clean-publish aem63-init aem63-clean-author aem63-clean-publish aem64-init aem64-clean-author aem64-clean-publish aem65-init aem65-clean-author aem65-clean-publish
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
	  java -server -Xms1024M -jar ../../../artifacts/$(4) -p $(3) $(5) -r $(2),nosamplecontent
endef

# a mix of wget and curl here just because
# - wget has a nice --no-clobber flag to skip sending any download request if file already exists
# - curl is the common AEM commands used by the community to execute ad-hoc actions
define aem_install_extras
  wget --no-clobber --directory-prefix=artifacts http://central.maven.org/maven2/com/shinesolutions/aem-healthcheck-content/$(2)/aem-healthcheck-content-$(2).zip
  curl -u admin:admin -F package=@"artifacts/aem-healthcheck-content-$(2).zip" http://localhost:$(1)/crx/packmgr/service/.json/?cmd=upload
	curl -u admin:admin -X POST http://localhost:$(1)/crx/packmgr/service/.json/etc/packages/shinesolutions/aem-healthcheck-content-$(2).zip?cmd=install&recursive=true
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

aemsdk-init:
	$(call aem_init,aemsdk)

aemsdk-clean-author:
	$(call aem_clean,aemsdk,author)

aemsdk-clean-publish:
	$(call aem_clean,aemsdk,publish)

aemsdk-start-author: aemsdk-init
	$(call aem_start,aemsdk,author,45662,AEM_SDK_Quickstart.jar,-nointeractive)

aemsdk-start-publish: aemsdk-init
	$(call aem_start,aemsdk,publish,45663,AEM_SDK_Quickstart.jar,-nointeractive)

aemsdk-backup-author: aemsdk-init
	$(call aem_backup,aemsdk,author)

aemsdk-backup-publish: aemsdk-init
	$(call aem_backup,aemsdk,publish)

aemsdk-restore-author: aemsdk-init
	$(call aem_restore,aemsdk,author)

aemsdk-restore-publish: aemsdk-init
	$(call aem_restore,aemsdk,publish)

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

aem62-install-extras-author: aem62-init
	$(call aem_install_extras,45622,1.3.3)

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
	$(call aem_start,aem63,author,45632,AEM_6.3_Quickstart.jar,-nointeractive)

aem63-start-publish: aem63-init
	$(call aem_start,aem63,publish,45633,AEM_6.3_Quickstart.jar,-nointeractive)

aem63-install-extras-author: aem63-init
	$(call aem_install_extras,45632,1.3.3)

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
	$(call aem_start,aem64,author,45642,AEM_6.4_Quickstart.jar,-nointeractive)

aem64-start-publish: aem64-init
	$(call aem_start,aem64,publish,45643,AEM_6.4_Quickstart.jar,-nointeractive)

aem64-install-extras-author: aem64-init
	$(call aem_install_extras,45642,1.3.3)

aem64-backup-author: aem64-init
	$(call aem_backup,aem64,author)

aem64-backup-publish: aem64-init
	$(call aem_backup,aem64,publish)

aem64-restore-author: aem64-init
	$(call aem_restore,aem64,author)

aem64-restore-publish: aem64-init
	$(call aem_restore,aem64,publish)

aem65-init:
	$(call aem_init,aem65)

aem65-clean-author:
	$(call aem_clean,aem65,author)

aem65-clean-publish:
	$(call aem_clean,aem65,publish)

aem65-start-author: aem65-init
	$(call aem_start,aem65,author,45652,AEM_6.5_Quickstart.jar,-nointeractive)

aem65-start-publish: aem65-init
	$(call aem_start,aem65,publish,45653,AEM_6.5_Quickstart.jar,-nointeractive)

aem65-install-extras-author: aem65-init
	$(call aem_install_extras,45652,1.3.3)

aem65-backup-author: aem65-init
	$(call aem_backup,aem65,author)

aem65-backup-publish: aem65-init
	$(call aem_backup,aem65,publish)

aem65-restore-author: aem65-init
	$(call aem_restore,aem65,author)

aem65-restore-publish: aem65-init
	$(call aem_restore,aem65,publish)

clean:
	rm -rf workspaces/

.PHONY: ci clean

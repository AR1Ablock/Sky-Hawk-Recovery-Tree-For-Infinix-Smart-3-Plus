#
# Copyright (C) 2021 The Android Open Source Project
# Copyright (C) 2021 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/infinix/Nova

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := generic

# Assert
TARGET_OTA_ASSERT_DEVICE := Nova

# Bootloader"
TARGET_BOOTLOADER_BOARD_NAME := CY-X627-H624

# Partition Size
BOARD_HAS_LARGE_FILESYSTEM := true 
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_CACHEIMAGE_PARTITION_SIZE := 209715200
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432 #This is the maximum known partition size, but it can be higher, so we just omit it
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2826960896
BOARD_METADATAIMAGE_PARTITION_SIZE := 33554432
BOARD_VENDORIMAGE_PARTITION_SIZE := 436207616
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true

# Partition Type
BOARD_RECOVERYIMAGE_PARTITION_TYPE := ext4
BOARD_BOOTIMAGE_PARTITION_TYPE := ext4
BOARD_VENDORIMAGE_PARTITION_TYPE := ext4
BOARD_METADATAIMAGE_PARTITION_TYPE := ext4
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATA_PARTITION_TYPE := f2fs
BOARD_USERDATAIMAGE_PARTITION_TYPE := f2fs

# File Systems
BOARD_RECOVERYMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_BOOTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_METADATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_USERDATA_FILE_SYSTEM_TYPE := f2fs

# Target
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_COPY_OUT_VENDOR := vendor
RECOVERY_SDCARD_ON_DATA := true

# Kernel
BOARD_KERNEL_CMDLINE := bootopt=64S3,32S1,32S1 cgroup_no_v1=memory,io buildvariant=user
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/zImage-dtb
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img
BOARD_INCLUDE_RECOVERY_DTBO := true
BOARD_BOOTIMG_HEADER_VERSION := 1
BOARD_KERNEL_BASE := 0x40000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x11b00000
BOARD_KERNEL_TAGS_OFFSET := 0x07880000
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_KERNEL_IMAGE_NAME := zImage-dtb
TARGET_KERNEL_ARCH := arm
TARGET_KERNEL_HEADER_ARCH := arm
TARGET_KERNEL_SOURCE := kernel/infinix/Nova
TARGET_KERNEL_CONFIG := Nova_defconfig

# Platform
TARGET_BOARD_PLATFORM := mt6761

# Partition
BOARD_USES_METADATA_PARTITION := true
BOARD_SUPPRESS_SECURE_ERASE := true
TARGET_USES_MKE2FS := true

# Decryption
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
TW_INCLUDE_METADATA_DECRYPT := true
BOARD_USES_FBE_DECRYPTION := true
TW_INCLUDE_CRYPTO_FBE := true

# Debugging
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
 
ifeq ($(TARGET_USES_LOGD), true)
    RELINK_SOURCE_FILES += $(TARGET_OUT_EXECUTABLES)/logd
    RELINK_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libsysutils.so
    RELINK_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libnl.so
endif
ifeq ($(TWRP_INCLUDE_LOGCAT), true)
    RELINK_SOURCE_FILES += $(TARGET_OUT_EXECUTABLES)/logcat
endif

# Hack: prevent anti rollback
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 16.1.0

# TWRP Configuration
#TW_THEME := portrait_hdpi
TARGET_SCREEN_WIDTH := 720
TARGET_SCREEN_HEIGHT := 1520
TW_EXTRA_LANGUAGES := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_USE_TOOLBOX := true

#Ignore Missing Dependencies
ALLOW_MISSING_DEPENDENCIES=true

#SHRP_Variables
SHRP_PATH := device/infinix/Nova
SHRP_MAINTAINER := @A-Rehman
SHRP_DEVICE_CODE := Nova
SHRP_EXTERNAL := /external_sd
SHRP_INTERNAL := /sdcard
SHRP_REC := /dev/block/by-name/recovery
SHRP_REC_TYPE := Treble
SHRP_DEVICE_TYPE := A-Only
SHRP_FLASH := 0
SHRP_DARK := true
SHRP_NOTCH := true
SHRP_SKIP_DEFAULT_ADDON_1 := true
SHRP_SKIP_DEFAULT_ADDON_2 := true
INC_IN_REC_ADDON_3 := true
INC_IN_REC_ADDON_4 := true
SHRP_SKIP_DEFAULT_ADDON_5 := true
SHRP_EXCLUDE_MAGISK_FLASH := true

# Setting up custom addons folder.
SHRP_EXTERNAL_ADDON_PATH := "device/infinix/Nova/recovery/root/twres/addons/"


# Custom Addons 1.
# Added Phh-Su addon.
SHRP_EXTERNAL_ADDON_1_NAME := "Install Phh Su"

# Text Message About Addon.
SHRP_EXTERNAL_ADDON_1_INFO := "This Root Works With GSI & Custom Roms. It Will Not Work in Stock Roms"

#Name Of Addon.
SHRP_EXTERNAL_ADDON_1_FILENAME := "Phh-Su.zip"

# Last Warning About Installtion.
SHRP_EXTERNAL_ADDON_1_BTN_TEXT := "Confirm"

# On Successfull Installtion.
SHRP_EXTERNAL_ADDON_1_SUCCESSFUL_TEXT := "Root Installed"

# To Add Custom Addon Inisde Ramdisk Other Wise addon will be saved into the internal storage (i.e: $(SHRP_INTERNAL)/SHRP/addons).
SHRP_INC_IN_REC_EXTERNAL_ADDON_1 := true


#Custom Addon 2.
# Added Phh-Su Remover addon.
SHRP_EXTERNAL_ADDON_2_NAME := "Remove Phh Su"

# Text Message About Addon.
SHRP_EXTERNAL_ADDON_2_INFO := "This Will Remove Phh Root From Your Device"

#Name Of Addon.
SHRP_EXTERNAL_ADDON_2_FILENAME := "Su-Remover.zip"

# Last Warning About Installtion.
SHRP_EXTERNAL_ADDON_2_BTN_TEXT := "Confirm"

# On Successfull Installtion.
SHRP_EXTERNAL_ADDON_2_SUCCESSFUL_TEXT := "Root Removed Successfully"

# To Add Custom Addon Inisde Ramdisk Other Wise addon will be saved into the internal storage (i.e: $(SHRP_INTERNAL)/SHRP/addons).
SHRP_INC_IN_REC_EXTERNAL_ADDON_2 := true


#Custom Addon 3.
# Added Boot Sign-In addon.
SHRP_EXTERNAL_ADDON_3_NAME := "Sign-In Boot"

# Text Message About Addon.
SHRP_EXTERNAL_ADDON_3_INFO := "This Will Sign-In your boot and twrp will not be replace by stock recovery after reboot"

#Name Of Addon.
SHRP_EXTERNAL_ADDON_3_FILENAME := "sign_boot.zip"

# Last Warning About Installtion.
SHRP_EXTERNAL_ADDON_3_BTN_TEXT := "Confirm"

# On Successfull Installtion.
SHRP_EXTERNAL_ADDON_3_SUCCESSFUL_TEXT := "Boot Sign-In Successfully"

# To Add Custom Addon Inisde Ramdisk Other Wise addon will be saved into the internal storage (i.e: $(SHRP_INTERNAL)/SHRP/addons).
SHRP_INC_IN_REC_EXTERNAL_ADDON_3 := true

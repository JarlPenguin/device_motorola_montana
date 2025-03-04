#
# Copyright (C) 2019 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from msm8937-common
$(call inherit-product, device/motorola/msm8937-common/msm8937.mk)

# Get non-open-source specific aspects
$(call inherit-product, vendor/motorola/montana/montana-vendor.mk)

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Properties
-include $(LOCAL_PATH)/vendor_prop.mk

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \
    $(LOCAL_PATH)/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml

# Camera
PRODUCT_PACKAGES += \
    libppeiscore_shim

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/camera/msm8937_mot_camera_conf.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/msm8937_mot_camera_conf.xml \
    $(LOCAL_PATH)/configs/camera/mot_ov5695_l5695f60_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/mot_ov5695_l5695f60_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/mot_s5k3p8sp_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/mot_s5k3p8sp_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/s5k3p3_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/s5k3p3_chromatix.xml

# Gatekeeper
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-impl \
    android.hardware.gatekeeper@1.0-service

# Kernel
ifeq ($(TARGET_PREBUILT_DT),)
    LOCAL_DT := device/motorola/montana-kernel/dt.img
else
    LOCAL_DT := $(TARGET_PREBUILT_DT)
endif
ifeq ($(TARGET_PREBUILT_KERNEL),)
    LOCAL_KERNEL := device/motorola/montana-kernel/Image.gz
else
    LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif
ifeq ($(TARGET_PREBUILT_RECOVERY_KERNEL),)
    LOCAL_RECOVERY_KERNEL := device/motorola/montana-kernel/recovery/Image.gz
else
    LOCAL_RECOVERY_KERNEL := $(TARGET_PREBUILT_RECOVERY_KERNEL)
endif
PRODUCT_VENDOR_KERNEL_HEADERS := device/motorola/montana-kernel/msm8937/kernel-headers

PRODUCT_COPY_FILES += \
    $(LOCAL_DT):dt.img \
    $(LOCAL_KERNEL):kernel \
    $(LOCAL_RECOVERY_KERNEL):recovery_kernel

# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/uinput-fpc.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/uinput-fpc.kl

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-impl \
    android.hardware.keymaster@3.0-service

# IDC
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/idc/uinput-fpc.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/uinput-fpc.idc

# NFC
PRODUCT_PACKAGES += \
    libnfc \
    com.android.nfc_extras \
    NfcNci \
    nqnfcee_access.xml \
    nqnfcse_access.xml \
    SecureElement \
    Tag \
    com.android.nfc_extras \
    android.hardware.nfc@1.2-service

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/nfc/libnfc-nci.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nci.conf \
    $(LOCAL_PATH)/configs/nfc/libnfc-nxp.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nxp.conf \
    $(LOCAL_PATH)/configs/nfc/libnfc-nxp_retcn.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nxp_retcn.conf

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_n/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_n/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.hcef.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_n/android.hardware.nfc.hcef.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_n/com.android.nfc_extras.xml

# PocketMode
PRODUCT_PACKAGES += \
    MotoPocketMode

# Ramdisk
PRODUCT_PACKAGES += \
    init.device.rc

PRODUCT_PACKAGES += \
    init.qcom.sensors.sh

# Sensors
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sensors/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf \
    $(LOCAL_PATH)/configs/sensors/sensor_def_qcomdev.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/sensor_def_qcomdev.conf

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Verity
PRODUCT_VENDOR_VERITY_PARTITION := /dev/block/platform/soc/7824900.sdhci/by-name/oem

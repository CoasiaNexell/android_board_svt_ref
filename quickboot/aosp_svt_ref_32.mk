#
# Copyright (C) 2015 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Inherit the full_base and device configurations
$(call inherit-product, device/nexell/quickboot/component.mk)

PRODUCT_NAME := aosp_svt_ref
PRODUCT_DEVICE := svt_ref
PRODUCT_BRAND := Android
PRODUCT_MODEL := AOSP on svt_ref
PRODUCT_MANUFACTURER := NEXELL

PRODUCT_COPY_FILES += \
	device/nexell/svt_ref/init.svt_ref_32.rc:root/init.svt_ref.rc

PRODUCT_COPY_FILES += \
	device/nexell/kernel/kernel-4.4.x/arch/arm/boot/zImage:kernel

PRODUCT_COPY_FILES += \
	device/nexell/kernel/kernel-4.4.x/arch/arm/boot/dts/s5p4418-svt_ref-rev00.dtb:2ndbootloader

PRODUCT_COPY_FILES += \
	device/nexell/svt_ref/quickboot/fstab.svt_ref:root/fstab.svt_ref

PRODUCT_COPY_FILES += \
	device/nexell/svt_ref/init.recovery.svt_ref.rc:root/init.recovery.svt_ref.rc

PRODUCT_PROPERTY_OVERRIDES += \
	ro.product.first_api_level=21

# vold check fs
PRODUCT_PROPERTY_OVERRIDES += \
	persist.vold.check_fs=0

# Disable bluetooth because svt_ref does not use bluetooth source
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += config.disable_bluetooth=true

# Disable other feature no needed in svt board
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += config.disable_serial=true
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += config.disable_samplingprof=true
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += config.disable_consumerir=true
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += config.disable_rtt=true
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += config.disable_vrmanager=true

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += config.quickboot=true

$(call inherit-product, device/nexell/svt_ref/device.mk)

PRODUCT_PACKAGES += \
	Launcher3 \
	Settings \
	Gallery2 \
	Camera2

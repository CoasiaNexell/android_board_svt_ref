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
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)

PRODUCT_NAME := aosp_svt_ref
PRODUCT_DEVICE := svt_ref
PRODUCT_BRAND := Android
PRODUCT_MODEL := AOSP on svt_ref
PRODUCT_MANUFACTURER := NEXELL

PRODUCT_COPY_FILES += \
	device/nexell/svt_ref/fstab.svt_ref:root/fstab.svt_ref

PRODUCT_COPY_FILES += \
	device/nexell/svt_ref/init.recovery.svt_ref.rc:root/init.recovery.svt_ref.rc

PRODUCT_PROPERTY_OVERRIDES += \
	ro.product.first_api_level=21

# Disable bluetooth because svt_ref does not use bluetooth source
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += config.disable_bluetooth=true

# Disable other feature no needed in svt board
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += config.disable_serial=true
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += config.disable_samplingprof=true
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += config.disable_consumerir=true
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += config.disable_rtt=true
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += config.disable_vrmanager=true

$(call inherit-product, device/nexell/svt_ref/device.mk)

PRODUCT_PACKAGES += \
	Launcher3

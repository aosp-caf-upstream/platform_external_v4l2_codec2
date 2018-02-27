# Build the unit tests.
LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)
LOCAL_ADDITIONAL_DEPENDENCIES := $(LOCAL_PATH)/Android.mk

LOCAL_MODULE := C2VDACompIntf_test

LOCAL_MODULE_TAGS := tests

LOCAL_SRC_FILES := \
  C2VDACompIntf_test.cpp \

LOCAL_SHARED_LIBRARIES := \
  libchrome \
  libcutils \
  liblog \
  libutils \
  libv4l2_codec2 \
  libv4l2_codec2_vda \

LOCAL_C_INCLUDES += \
  $(TOP)/external/v4l2_codec2/include \
  $(TOP)/external/v4l2_codec2/vda \
  $(TOP)/frameworks/av/media/libstagefright/codec2/include \

LOCAL_CFLAGS += -Werror -Wall -std=c++14
LOCAL_CLANG := true

LOCAL_LDFLAGS := -Wl,-Bsymbolic

include $(BUILD_NATIVE_TEST)


include $(CLEAR_VARS)
LOCAL_ADDITIONAL_DEPENDENCIES := $(LOCAL_PATH)/Android.mk

LOCAL_MODULE := C2VDAComponent_test

LOCAL_MODULE_TAGS := tests

LOCAL_SRC_FILES := \
  C2VDAComponent_test.cpp \

LOCAL_SHARED_LIBRARIES := \
  libchrome \
  libcutils \
  liblog \
  libmedia \
  libstagefright \
  libstagefright_codec2 \
  libstagefright_codec2_vndk \
  libstagefright_foundation \
  libutils \
  libv4l2_codec2 \
  libv4l2_codec2_vda \
  libv4l2_codec2_vndk \

LOCAL_C_INCLUDES += \
  $(TOP)/external/v4l2_codec2/include \
  $(TOP)/external/v4l2_codec2/vda \
  $(TOP)/external/v4l2_codec2/vndk/include \
  $(TOP)/frameworks/av/media/libstagefright/codec2/include \
  $(TOP)/frameworks/av/media/libstagefright/codec2/vndk/include \
  $(TOP)/frameworks/av/media/libstagefright/include \

LOCAL_CFLAGS += -Werror -Wall -std=c++14
LOCAL_CLANG := true

LOCAL_LDFLAGS := -Wl,-Bsymbolic

# define ANDROID_VERSION from PLATFORM_VERSION major number (ex. 7.0.1 -> 7)
ANDROID_VERSION := $(word 1, $(subst ., , $(PLATFORM_VERSION)))

ifeq ($(ANDROID_VERSION),7)  # NYC
LOCAL_CFLAGS += -DANDROID_VERSION_NYC
else
LOCAL_SHARED_LIBRARIES += libmediaextractor
endif

include $(BUILD_NATIVE_TEST)

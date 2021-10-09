# allows to add DEPLOYMENTFOLDERS and links to the Felgo library and QtCreator auto-completion
CONFIG += felgo

# Project identifier and version
# More information: https://felgo.com/doc/felgo-publishing/#project-configuration
PRODUCT_IDENTIFIER = com.bunistack.furniture
PRODUCT_VERSION_NAME = 1.0.0
PRODUCT_VERSION_CODE = 1

PRODUCT_LICENSE_KEY = ""

qmlFolder.source = qml

assetsFolder.source = assets

RESOURCES += resources.qrc

SOURCES += main.cpp \
    utility.cpp


android {
    ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
    OTHER_FILES += android/AndroidManifest.xml       android/build.gradle
}

ios {
    QMAKE_INFO_PLIST = ios/Project-Info.plist
    OTHER_FILES += $$QMAKE_INFO_PLIST

    HEADERS += ios/src/iosutils.h
    SOURCES += ios/src/iosutils.mm
}

# set application icons for win and macx
win32 {
    RC_FILE += win/app_icon.rc
}
macx {
    ICON = macx/app_icon.icns
}

HEADERS += \
    utility.h

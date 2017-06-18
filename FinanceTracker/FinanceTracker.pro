TEMPLATE = app
QT += qml quick

CONFIG(debug, debug|release) {
  CONFIGURATION = Debug
} else:CONFIG(release, debug|release) {
  CONFIGURATION = Release
}

WORKINGDIR = ./../data
SOURCEDIR = ./sources

win32|unix|!android {
  DESTDIR = $$WORKINGDIR
}

TARGET = $${TARGET}_$${CONFIGURATION}

CONFIG += c++14

DEFINES += QT_USE_QSTRINGBUILDER QT_DEPRECATED_WARNINGS

INCLUDEPATH +=\
  $$SOURCEDIR

SOURCES +=\
  $$SOURCEDIR/main.cpp

RESOURCES += qml/qml.qrc

android {
  QT += androidextras
  QMAKE_CXXFLAGS += -fpermissive

  ANDROID_PACKAGE_SOURCE_DIR = ./android

  DISTFILES += \
    $$ANDROID_PACKAGE_SOURCE_DIR/AndroidManifest.xml \
    $$ANDROID_PACKAGE_SOURCE_DIR/gradle/wrapper/gradle-wrapper.jar \
    $$ANDROID_PACKAGE_SOURCE_DIR/gradlew \
    $$ANDROID_PACKAGE_SOURCE_DIR/res/values/libs.xml \
    $$ANDROID_PACKAGE_SOURCE_DIR/build.gradle \
    $$ANDROID_PACKAGE_SOURCE_DIR/gradle/wrapper/gradle-wrapper.properties \
    $$ANDROID_PACKAGE_SOURCE_DIR/gradlew.bat
}

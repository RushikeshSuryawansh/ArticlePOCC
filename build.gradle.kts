buildscript {
    repositories {
        gradlePluginPortal()
        jcenter()
        google()
        mavenCentral()
    }
    dependencies {
        classpath("org.jetbrains.kotlin:kotlin-gradle-plugin:1.4.10")
        classpath("com.android.tools.build:gradle:4.0.1")
        classpath("org.jetbrains.kotlin:kotlin-serialization:1.5.0")
        classpath("org.jetbrains.kotlinx:kotlinx-coroutines-core:1.4.2-native-mt")
    }
}

allprojects {
    repositories {
        google()
        jcenter()
        mavenCentral()
    }
}
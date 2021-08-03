# Welcome to ArticlePOC
​
<img src="/media/ArticleScreens.png"/>
​
​
​


ArticlePOC is cross-platform application built with [Kotlin Multiplatform Mobile](https://kotlinlang.org/lp/mobile/). Where Business logic for network call is written in kotlin and UI is designed by native side. ArticlePOC is integrated with NY Times Most Popular Articles API. It's been designed to demonstrate how KMM can be used in real production projects.
​
​
## Project structure
​
This repository contains a common Kotlin Multiplatform module, an Android project, and an iOS project. The common module is connected with the Android project via the Gradle multi-project mechanism. For use in iOS applications, the shared module compiles into a framework that is exposed to the Xcode project via the `PackForXcode` Gradle task. This framework connects to the Xcode project that builds an iOS application.
​
You can achieve the same structure by creating a project with the [KMM Plugin project wizard](https://plugins.jetbrains.com/plugin/14936-kotlin-multiplatform-mobile) or cloning the [basic sample project](https://github.com/Kotlin/kmm-sample/).
​
<img src="/media/basic-project-structure.png"/>
​
​
## Architecture

The **architecture** of this project is composed by one **common module** and its **platform specific** implementations
(jvm, js and ios). A **common-client** module and the **platform specific** modules. One **backend** and three
**clients** (android, ios and web).

<h3 align="center">
  <img src="/media/architecture.png" alt="Project Architecture" />
</h3>

- **common**: Contains all the **common code** shared between the modules. In this case are only the **data** models.
- **common-jvm/js/ios**: Where the **common platform specific** implementations are placed.
- **common-client**: Where the **clients common** code is implemented. Such as the **business** and **presentation**
logic.
- **common-client-jvm/js/ios**: Responsible for the **common client specific** implementations.
- **backend**: Contains the **server** logic and a REST API.
- **android**: Responsible for the **android** clients. Contains a **mobile** module but you can add
others (e.g.: **wear**).
- **ios**: The **iOS** client!
- **web**: The **web client** that runs in the browser.

How everything is connected?

This project uses [Gradle](https://gradle.org/) that is responsible to **build** and **connect** all the modules.

The **common** module contains only the data models since it's the only code that we want to share between the
**backend** and the **client** modules.

But, what if this **common** module needs specific implementations for each platform? This's why we have the
**common-jvm**, **common-js** and **common-ios** platform modules. They are connected with the **common** module by an
**expectedBy** dependency and implement the **actual** classes that are **expected** in the **common** module
(e.g.: date, etc...).

The **common-client** module is responsible to implement the repositories, use cases and presenters. This is the code
that we want to share only between clients. And, again, if we want to implement platform specific parts
(e.g.: coroutines dispatcher, etc...) we have the **common-client-jvm**, **common-client-js** and **common-client-ios**
platform modules.

The other modules **(android, ios, and web)** use the **common-client** modules by **compiling** the platform specific
module. And, since we are using the MVP pattern, clients only need to implement the **View** part that is specific for
each platform.

Finally, the **backend** module is connected with the common code by **compiling** the **common-jvm** module.

<table>
<tr>
<td>
<i><b>Note:</b> This architecture was designed to work with both <b>backend</b> and <b>clients</b>. If you <b>only</b>
want to implement a <b>multiplatform</b> project with <b>clients</b> (probably the most common use case), you can
<b>merge</b> the <b>common</b> modules with the <b>common-client</b> modules. Moreover, don't forget to <b>remove</b>
the <b>platform</b> specific modules if you will not implement modules which use that <b>platform</b>.</i>
</td>
</tr>
</table>

## Backend

The backend is implemented using the [ktor](http://ktor.io/) framework.


## How to run

IDE : Android Studio, XCode

OS : Mac (For running project on iOS)

1. Open ArticlePOC projet into AndroidStudio
2. It will automatialling download all require gradle dependanies
3. Then run appliation from AndroidStudio
4. After successfully running project into androidstudio, Now open XCode at path "Projects/ArticlePOC/iosApp/iosApp.xcodeproj"
5. Build iOS project on device or simulator.   




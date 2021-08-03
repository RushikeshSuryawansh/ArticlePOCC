package com.example.articlepoc.shared

expect class Image

expect fun ByteArray.toNativeImage(): Image?

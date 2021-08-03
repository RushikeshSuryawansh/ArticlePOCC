package com.example.articlepoc.shared
import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable

@Serializable
data class Media(
        val approved_for_syndication: Int? = null,
        val caption: String? = null,
        val copyright: String? = null,
        @SerialName("media-metadata") val MediaMetadata: List<MediaMetadata>? = null,
        val subtype: String? = null,
        val type: String? = null
)
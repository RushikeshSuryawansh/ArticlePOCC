package com.example.articlepoc.shared
import kotlinx.serialization.Serializable

@Serializable
data class Result(
    val abstract: String? = null,
    val adx_keywords: String? = null,
    val asset_id: Long? = null,
    val byline: String? = null,
    val column: String? = null,
    val des_facet: List<String>,
    val eta_id: Int? = null,
    val geo_facet: List<String>,
    val id: Long? = null,
    val media: List<Media>? = null,
    val nytdsection: String? = null,
    val org_facet: List<String>,
    val per_facet: List<String>,
    val published_date: String? = null,
    val section: String? = null,
    val source: String? = null,
    val subsection: String? = null,
    val title: String? = null,
    val type: String? = null,
    val updated: String? = null,
    val uri: String? = null,
    val url: String? = null
)
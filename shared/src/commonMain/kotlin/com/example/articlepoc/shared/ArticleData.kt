package com.example.articlepoc.shared

import kotlinx.serialization.Serializable

@Serializable
data class ArticleData(
        val copyright: String? = null,
        val num_results: Int? = null,
        val results: List<Result>,
        val status: String? = null
)
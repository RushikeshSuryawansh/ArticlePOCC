package com.example.articlepoc.shared

// 1
import io.ktor.client.*
import io.ktor.client.request.*
import kotlinx.coroutines.GlobalScope
import kotlinx.coroutines.launch
import kotlinx.serialization.json.Json

// 2
class ArticleAPI() {
    // 3
    // 3
    private val apiUrl =
            "http://api.nytimes.com/svc/mostpopular/v2/viewed/7.json?api-key=FzNP21AILlN96obrslapYoIddkGIjWVG"


    // 4
    fun getArticleList(
            success: (List<Result>) -> Unit, failure: (Throwable?) -> Unit) {
        // 5
        GlobalScope.launch(ApplicationDispatcher) {
            try {
                val url = apiUrl
                // 6
                val json = HttpClient().get<String>(url)

                // 7
                Json{
                    ignoreUnknownKeys = true
                }.decodeFromString(ArticleData.serializer(), json)
                        .results
                        .also(success)
            } catch (ex: Exception) {
                failure(ex)
            }
        }
    }

    // 8
    fun getImage(
            url: String, success: (Image?) -> Unit, failure: (Throwable?) -> Unit) {
        GlobalScope.launch(ApplicationDispatcher) {
            try {
                // 9
                HttpClient().get<ByteArray>(url)
                        .toNativeImage()
                        .also(success)
            } catch (ex: Exception) {
                failure(ex)
            }
        }
    }
}

package com.ahmedmamdouh13.ama.countdown

sealed class MyResult {
    data class Success<T>(val data: T): MyResult()
    data class Error(val e: Exception): MyResult()
    data class Loading(val msg: String): MyResult()
}
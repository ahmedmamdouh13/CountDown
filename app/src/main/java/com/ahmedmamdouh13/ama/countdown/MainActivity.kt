package com.ahmedmamdouh13.ama.countdown

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle

class MainActivity : AppCompatActivity() {

    lateinit var data: MyResult

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)


        when(data){
            is MyResult.Error -> (data as MyResult.Error).e.printStackTrace()
            is MyResult.Loading -> (data as MyResult.Loading).msg
            is MyResult.Success<*> -> data as MyResult.Success<String>
        }


    }
}
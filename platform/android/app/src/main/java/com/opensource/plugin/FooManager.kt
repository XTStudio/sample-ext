package com.opensource.plugin

import android.os.Handler
import com.xt.endo.EDOJavaHelper
import java.util.*
import kotlin.concurrent.timerTask

var staticLocation = "佛山"

class FooManager {

    var name: String = ""

    val location: String
        get() {
            return staticLocation
        }

    init {
        val handler = Handler()
        Timer().schedule(timerTask {
            handler.post {
                staticLocation = "广州"
                EDOJavaHelper.emit(this@FooManager, "locationChanged")
            }
        }, 6000)
    }

    fun changeName(name: String) {
        this.name = name
    }

    companion object {

        val sharedInstance = FooManager()

        @JvmStatic fun sharedManager(): FooManager {
            return sharedInstance
        }

    }

}
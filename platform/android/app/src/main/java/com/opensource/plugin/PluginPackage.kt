package com.opensource.plugin

import com.xt.endo.EDOExporter
import com.xt.endo.EDOPackage

class PluginPackage: EDOPackage() {

    init {
        // export FooManager
        EDOExporter.sharedExporter.exportClass(FooManager::class.java, "FooManager")
        EDOExporter.sharedExporter.exportStaticMethodToJavaScript(FooManager::class.java, "sharedManager")
        EDOExporter.sharedExporter.exportProperty(FooManager::class.java, "name")
        EDOExporter.sharedExporter.exportProperty(FooManager::class.java, "location", true)
        EDOExporter.sharedExporter.exportMethodToJavaScript(FooManager::class.java, "changeName")
        // export MKMapView
        EDOExporter.sharedExporter.exportClass(MKMapView::class.java, "MKMapView", "UIView")
    }

}
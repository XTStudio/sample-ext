/// <reference path="../sample_ext.d.ts" />

class MainViewController extends UIViewController {

    fooLabel = new UILabel
    mapView = new MKMapView

    viewDidLoad() {
        super.viewDidLoad()
        this.setupFooManagerTests()
        this.setupMapView()
    }

    setupFooManagerTests() {
        this.fooLabel.textAlignment = UITextAlignment.center
        FooManager.sharedManager().name = "Pony"
        this.fooLabel.text = `${FooManager.sharedManager().name} @${FooManager.sharedManager().location}`
        this.view.addSubview(this.fooLabel)
        DispatchQueue.main.asyncAfter(3.0, () => {
            FooManager.sharedManager().changeName("Benji")
            this.fooLabel.text = `${FooManager.sharedManager().name} @${FooManager.sharedManager().location}`
        })
        FooManager.sharedManager().on("locationChanged", () => {
            this.fooLabel.text = `${FooManager.sharedManager().name} @${FooManager.sharedManager().location}`
        })
    }

    setupMapView() {
        this.view.addSubview(this.mapView)
    }

    viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        this.fooLabel.frame = { x: 0, y: 0, width: this.view.bounds.width, height: 88 }
        this.mapView.frame = { x: 0, y: 66, width: this.view.bounds.width, height: this.view.bounds.height - 66 }
    }

}

global.main = new MainViewController

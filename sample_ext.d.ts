interface FooManagerEventMap extends BaseEventMap {
    "locationChanged": () => void,
}

declare class FooManager {
    static sharedManager(): FooManager
    name: string
    readonly location: string
    changeName(name: string): void
    // EventEmitter
    on<K extends keyof FooManagerEventMap>(type: K, listener: FooManagerEventMap[K]): this
    once<K extends keyof FooManagerEventMap>(type: K, listener: FooManagerEventMap[K]): this
    off<K extends keyof FooManagerEventMap>(type: K, listener: FooManagerEventMap[K]): this
    emit<K extends keyof FooManagerEventMap>(type: K, ...args: any[]): this
}

declare class MKMapView extends UIView {

}
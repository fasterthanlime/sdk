
// Boehm GC stuff

Memory: class {

    alloc: extern(GC_malloc) static func (size: SizeT) -> Pointer

}


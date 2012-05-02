
// Boehm GC!

include gc/gc | (GC_THREADS)
include gc/gc_pthread_redirects | (GC_NO_THREAD_REDIRECTS)

Memory: class {

    alloc: extern(GC_malloc) static func (size: SizeT) -> Pointer

}


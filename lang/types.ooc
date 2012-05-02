
include stdbool, stdint, stddef

/**
 * objects
 */
Object: abstract class {

    class: Class

    /// Instance initializer: set default values for a new instance of this class
    __defaults__: func {}

    /// Finalizer: cleans up any objects belonging to this instance
    __destroy__: func {}

    /** return true if *class* is a subclass of *T*. */
    instanceOf?: final func (T: Class) -> Bool {
        if(!this) return false
        
        current := class
        while(current) {
            if(current == T) return true
            current = current super
        }
        false
    }

}

Class: abstract class {

    /// Number of octets to allocate for a new instance of this class
    instanceSize: SizeT

    /** Number of octets to allocate to hold an instance of this class
        it's different because for classes, instanceSize may greatly
        vary, but size will always be equal to the size of a Pointer.
        for basic types (e.g. Int, Char, Pointer), size == instanceSize */
    size: SizeT

    /// Human readable representation of the name of this class
    name: String

    /// Pointer to instance of super-class
    super: const Class

    /// Create a new instance of the object of type defined by this class
    alloc: final func ~_class -> Object {
        object := Memory alloc(instanceSize) as Object
        if(object) {
            object class = this
        }
        return object
    }

    inheritsFrom?: final func ~_class (T: Class) -> Bool {
        current := this
        while(current) {
            if(current == T) return true
            current = current super
        }
        false
    }

}

// basic types

Void: cover from void
Pointer: cover from Void*
Bool: cover from bool
SizeT: cover from size_t
UInt8: cover from unsigned char
Int8: cover from char

/**
 * Closures
 */
Closure: cover {
    thunk  : Pointer
    context: Pointer
}

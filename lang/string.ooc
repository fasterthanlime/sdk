
import libc/[stdio, string]

// bare-bones C string

CString: cover from Int8* {

    length: SizeT {
        get {
            strlen(this)
        }
    }
    
}

// ooc Strings with candy

String: class {

    data: CString
    length: SizeT

    init: func (=data, =length)

    println: func {
        printf("%s\n", data)
    }

}

// implicit conversions

operator implicit as (s: String) -> CString {
    s data
}

operator implicit as (c: CString) -> String {
    String new(c, c length)
}

// compiler hook, for compatibility with rock..

makeStringLiteral: func (data: CString, length: SizeT) -> String {
    String new(data, length)
}


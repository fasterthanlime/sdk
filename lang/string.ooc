
import libc/[stdio, string]

// bare-bones C string

CString: cover from UInt8* {

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
        printf("%s", data)
    }

}

// implicit conversions

operator implicit as (s: String) -> CString {
    s data
}

operator implicit as (c: CString) -> String {
    String new(c, c length)
}

// compiler hook

makeStringLiteral: func (data: CString, length: SizeT) -> String {
    String new(data, length)
}


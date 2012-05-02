
// compiler hook, for compatibility with rock..

makeStringLiteral: func (data: CString, length: SizeT) -> String {
    String new(data, length)
}


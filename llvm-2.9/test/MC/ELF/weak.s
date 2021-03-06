// RUN: llvm-mc -filetype=obj -triple x86_64-pc-linux-gnu %s -o - | elf-dump  | FileCheck %s

// Test that this produces a weak undefined symbol.

	.weak	foo
        .long   foo

// And that bar is after all local symbols and has non zero value.
        .weak bar
bar:

//CHECK:        # Symbol 0x00000004
//CHECK-NEXT:   (('st_name', 0x00000005) # 'bar'
//CHECK-NEXT:    ('st_bind', 0x00000002)
//CHECK-NEXT:    ('st_type', 0x00000000)
//CHECK-NEXT:    ('st_other', 0x00000000)
//CHECK-NEXT:    ('st_shndx', 0x00000001)
//CHECK-NEXT:    ('st_value', 0x0000000000000004)
//CHECK-NEXT:    ('st_size', 0x0000000000000000)
//CHECK-NEXT:   ),
//CHECK-NEXT:   # Symbol 0x00000005
//CHECK:       (('st_name', 0x00000001) # 'foo'
//CHECK-NEXT:   ('st_bind', 0x00000002)
//CHECK-NEXT:   ('st_type', 0x00000000)
//CHECK-NEXT:   ('st_other', 0x00000000)
//CHECK-NEXT:   ('st_shndx', 0x00000000)
//CHECK-NEXT:   ('st_value', 0x0000000000000000)
//CHECK-NEXT:   ('st_size', 0x0000000000000000)
//CHECK-NEXT:  ),
//CHECK-NEXT: ])

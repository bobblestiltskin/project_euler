.macro caller_save_regs_on_stack
        stp x17, x18, [sp, #-0x50]!
        stp x15, x16, [sp, #0x10]
        stp x13, x14, [sp, #0x20]
        stp x11, x12, [sp, #0x30]
        stp  x9, x10, [sp, #0x40]
.endm

.macro caller_restore_regs_from_stack
        ldp x9, x10, [sp, #0x40]
        ldp x11, x12, [sp, #0x30]
        ldp x13, x14, [sp, #0x20]
        ldp x15, x16, [sp, #0x10]
        ldp x17, x18, [sp], #0x50
.endm

.macro callee_save_regs_on_stack
        stp x27, x28, [sp, #-0x50]!
        stp x25, x26, [sp, #0x10]
        stp x23, x24, [sp, #0x20]
        stp x21, x22, [sp, #0x30]
        stp x19, x20, [sp, #0x40]
.endm

.macro callee_restore_regs_from_stack
        ldp x19, x20, [sp, #0x40]
        ldp x21, x22, [sp, #0x30]
        ldp x23, x24, [sp, #0x20]
        ldp x25, x26, [sp, #0x10]
        ldp x27, x28, [sp], #0x50
.endm

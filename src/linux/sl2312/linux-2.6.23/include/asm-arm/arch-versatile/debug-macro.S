/* linux/include/asm-arm/arch-versatile/debug-macro.S
 *
 * Debugging macro include header
 *
 *  Copyright (C) 1994-1999 Russell King
 *  Moved from linux/arch/arm/kernel/debug.S by Ben Dooks
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation.
 *
*/

		.macro	addruart,rx
		mrc	p15, 0, \rx, c1, c0
		tst	\rx, #1			@ MMU enabled?
		moveq	\rx,      #0x10000000
		movne	\rx,      #0xf1000000	@ virtual base
		orr	\rx, \rx, #0x001F0000
		orr	\rx, \rx, #0x00001000
		.endm

#include <asm/hardware/debug-pl01x.S>

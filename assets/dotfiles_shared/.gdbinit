#
# References:
# Sun, 29 Jan 2012 19:39:13 +0100 [1] assembly - Show current instruction in gdb - Stack Overflow <http://stackoverflow.com/questions/1902901/show-current-instruction-in-gdb>
# Sun, 29 Jan 2012 19:39:15 +0100 [2] dc0d32: Debugging kernel with qemu and gdb <http://dc0d32.blogspot.com/2010/03/debugging-kernel-with-qemu-and-gdb.html>
# Wed, 08 Feb 2012 18:35:59 +0100 [3] terminal - Prettify my gdb - Stack Overflow <http://stackoverflow.com/questions/209534/prettify-my-gdb>
# Wed, 08 Feb 2012 18:42:49 +0100 [4] Debugging with GDB <http://sourceware.org/gdb/current/onlinedocs/gdb/>
# Wed, 08 Feb 2012 18:53:17 +0100 [5] TUI - Debugging with GDB <http://sourceware.org/gdb/current/onlinedocs/gdb/TUI.html#TUI>
# Wed, 08 Feb 2012 22:09:12 +0100 [6] Preparing An Executable For Debugging, Peter's gdb Tutorial: Memory Layout And The Stack <http://dirac.org/linux/gdb/02a-Memory_Layout_And_The_Stack.php#wherearewegoingtogo>
# Wed, 08 Feb 2012 22:13:07 +0100 [7] Setting The List Size, Peter's gdb Tutorial: Initialization, Listing, And Running <http://dirac.org/linux/gdb/03-Initialization,_Listing,_And_Running.php#settingthelistsize>
# Wed, 08 Feb 2012 22:19:00 +0100 [8] Debugging Options - Using the GNU Compiler Collection (GCC) <http://gcc.gnu.org/onlinedocs/gcc/Debugging-Options.html#Debugging-Options>
# Sat, 17 Mar 2012 15:25:28 +0100 [9] c++ - How do I print the full value of a long string in gdb? - Stack Overflow <http://stackoverflow.com/questions/233328/how-do-i-print-the-full-value-of-a-long-string-in-gdb>
#

display/i	$pc
set		history		save		on
set		listsize	35
set		output-radix	10
set		print		elements	0
set		print		pretty

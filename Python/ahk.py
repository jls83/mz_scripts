from ctypes import *

ahk = cdll.AutoHotkey
pyclient = create_string_buffer("ahkpython.ahk")   # no unicode in ahk

CMPFUNC = CFUNCTYPE(c_int, c_int)
def py_cmp_func(a):
     print "ahk: " , a
     return a

cmp_func = CMPFUNC(py_cmp_func)
fx = create_string_buffer(str(cast(cmp_func, c_void_p).value))

script = create_string_buffer("""
fx2(msg){
WinActivate %msg%
msgbox in function fx2 with %msg% from python 
return "success" 
}
""")
ahk.ahkdll(pyclient, "", fx) 
ahk.ahkassign(create_string_buffer("fx"), fx)
ahk.addScript(script)
ahk.ahkFunction(create_string_buffer("fx2"), create_string_buffer("Untitled"))
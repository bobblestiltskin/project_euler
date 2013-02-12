: cdump ( ptr count -- )
( dumps count bytes from ptr )
  0 do
    dup i + c@ 1 u.r
  loop
  drop cr
;

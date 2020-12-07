source  /opt/pwndbg/gdbinit.py
source  /opt/Pwngdb/pwngdb.py
source  /opt/Pwngdb/angelheap/gdbinit.py

define hook-run
python
import angelheap
angelheap.init_angelheap()
end
end
# remove time stamp
/^--- stock_/  { print $1 " " $2; next; }
/^+++ modded_/ { print $1 " " $2; next; }

# convert obsolete form
/^diff -Npru /  { sub(/diff -Npru /, "diff -NpruEbB -x '*RIL'"); }
/stock-/  { sub(/stock-/, "stock_"); sub(/modded-/, "modded_"); print; next; }

# keep rest of file as is:
{ print; }

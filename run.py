import example

a = 5
b = 12

# Now call our C function with a bunch of callbacks  

print("Call the functions directly...")
print("    add(a,b) = %s" % example.add(a, b))
print("    sub(a,b) = %s" % example.sub(a, b))
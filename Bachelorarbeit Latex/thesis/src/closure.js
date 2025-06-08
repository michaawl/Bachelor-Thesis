






// note line 10 to .. will be included in latex

print("we go in for closures now :)")

function nextNumber(){
	var startWith=222;
	function nxt(){
		startWith+=1 // !!
		return startWith
	}
	return nxt
}
var nn = nextNumber()
print("In latex long source code lines might force a line wrap if the parameter breaklines in lstset is set.")
print( nn() )
print( nn() )
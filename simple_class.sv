class counter;
	protected int count ;

	function void load (int value);
		count =value ;
	endfunction 

	function int getcount  ();
		return count ;
	endfunction

endclass

module test ;
initial begin
	counter c1 ;
	c1 =new();
	c1.load(9);
	$display( "The counter After loading :%d ",c1.getcount());
	 
	c1.load(10);
	$display ("The counter After loading",c1.getcount());
end 
endmodule 

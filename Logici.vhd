-- Cory Anderson
-- 2015.10.31
-- D0

library ieee; 
use ieee.std_logic_1164.all;
entity Logici is port(
	D0, D1, D2, D3:	in	std_logic;
	EV, CW:			in	std_logic;
	Red, Yellow:	in	std_logic;
	D0i, D1i, D2i, D3i:	out	std_logic;
	Redi, Yellowi: 	out	std_logic);
end Logici;

--				( 	
--					not D3 and 
--					not D2 and 
--					not D1 and 
--					not D0
--				)

architecture behavior of Logici is
begin
	D0i <=
	(	
		(--yellow2 -> red1	
				D3 and 
			not D2 and 
			not D1 and 
			not D0
		)
		or
		(not EV and 
		(
			( 	
				not	D3 and 
				not D2 and 
				not D1 and 
				not D0
			)
			or
			( 	
				not D3 and 
				not	D2 and 
					D1 and 
				not D0
			)
			or
			( 		
					D3 and 
					D2 and 
					D1 and 
				not D0
			)
			or
			( CW and --Case for CW --> yellow 1
				( 	
					not D3 and 
						D2 and 
					not D1 and 
					not D0
				)
			)
		))
		or
		(EV and
		(
			( 		
					D3 and 
					D2 and 
					D1 and 
				not D0
			)
			or
			( 		
					D3 and 
					D2 and 
					D1 and 
					D0
			)
		))
	);

	D1i <=
	(	
		(not EV and 
		(
			( 	
				not	D3 and 
				not D2 and 
				not D1 and 
					D0
			)
			or
			( 	
				not D3 and 
				not	D2 and 
					D1 and 
				not D0
			)
			or
			( 		
					D3 and 
					D2 and 
				not D1 and 
					D0
			)
			or
			( 		
					D3 and 
					D2 and 
					D1 and 
				not D0
			)
		))
		or
		(EV and
		(
			( 		
					D3 and 
					D2 and 
				not D1 and 
					D0
			)
			or
			( 		
					D3 and 
					D2 and 
					D1 and 
				not D0
			)
			or
			( 		
					D3 and 
					D2 and 
					D1 and 
					D0
			)
		))
	);

	D2i <=
	(
		(--yellow2 -> red1
				D3 and 
			not D2 and 
			not	D1 and 
			not	D0
		)
		or	
		(not EV and 
		(
			( 	
				not	D3 and 
				not D2 and 
					D1 and 
					D0
			)
			or
			( 		
					D3 and 
					D2 and 
				not D1 and 
					D0
			)
			or
			( 		
					D3 and 
					D2 and 
					D1 and 
				not D0
			)
		))
		or
		(EV and
		(
			( 		
					D3 and 
					D2 and 
				not	D1 and 
					D0
			)
			or
			( 		
					D3 and 
					D2 and 
					D1 and 
				not	D0
			)
			or
			( 		
					D3 and 
					D2 and 
					D1 and 
					D0
			)
		))
	);

	D3i <=
	(	
		(--yellow1 -> yellow2 		
				D3 and 
			not	D2 and 
			not	D1 and 
				D0
		)
		or
		(--yellow2 -> red1
				D3 and 
			not	D2 and 
			not	D1 and 
			not	D0
		)
		or
		(--red1 -> red2
				D3 and 
				D2 and 
			not	D1 and 
				D0
		)
		or
		(--red2 -> red3
				D3 and 
				D2 and 
				D1 and 
			not	D0
		)
		or
		(not EV and 
		(
			( CW and --Case for CW --> yellow 1
				( 	
					not D3 and 
						D2 and 
					not D1 and 
					not D0
				)
			)
		))
		or
		(EV and
		(
			( 		
				not	D3 and 
				not D2 and 
				not D1 and 
				not D0
			)
			or
			( 		
				not	D3 and 
				not	D2 and 
				not	D1 and 
					D0
			)
			or
			( 	
				not	D3 and 
				not D2 and 
					D1 and 
				not D0
			)
			or
			( 	
				not	D3 and 
				not D2 and 
					D1 and 
					D0
			)
			or
			( 	
				not	D3 and 
					D2 and 
				not D1 and 
				not D0
			)
			or
			( 		
					D3 and 
					D2 and 
					D1 and 
					D0
			)
		))
	);

	Redi <=
	(
		(
				D3 and 
				D2 and 
			not D1 and 
				D0
		)
		or
		(
				D3 and 
				D2 and 
				D1 and 
			not D0
		)
		or
		(
				D3 and 
				D2 and 
				D1 and 
				D0
		)
	);

	Yellowi <=
	(
		not Red and
		(
			EV or
			( 	
					D3 and 
				not D2 and 
				not D1 and 
					D0
			)
			or
			( 	
					D3 and 
				not D2 and 
				not D1 and 
				not D0
			)
		)
	);
end behavior;
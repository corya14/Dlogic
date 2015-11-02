-- Cory Anderson
-- 2015.10.31

library ieee; 
use ieee.std_logic_1164.all;
entity Logici2 is port(
	D0, D1, D2, D3:	in	std_logic;
	EV:				in	std_logic;
	CW:				in	std_logic;
	Red:			in	std_logic;
	Yellow:			in	std_logic;
	--J & K control D0 JKf
	--Will toggle by default
	J, K:			out	std_logic;
	D1i, D2i:		out	std_logic;
	--T controls D3 Tff
	T:				out	std_logic;
	Redi, Yellowi: 	out	std_logic);
end Logici2;

--				( 	
--					not D3 and 
--					not D2 and 
--					not D1 and 
--					not D0
--				)

architecture behavior of Logici2 is
signal J_L, K_L: std_logic;
begin
	J_L <=
	(
		EV and
		(
			(--S0	
				not	D3 and 
				not	D2 and 
				not	D1 and 
				not	D0
			)
			or
			(--S1	
				not	D3 and 
				not	D2 and 
				not	D1 and 
					D0
			)
			or
			(--S2	
				not	D3 and 
				not	D2 and 
					D1 and 
				not	D0
			)
			or
			(--S3
				not	D3 and 
				not	D2 and 
					D1 and 
					D0
			)
			or
			(--S4
				not	D3 and 
					D2 and 
				not	D1 and 
				not	D0
			)
			or
			(--Red3
					D3 and 
					D2 and 
					D1 and 
					D0
			)
		)	
	);

	K_L <=
	(
		EV and
		(
			(--Red3
					D3 and 
					D2 and 
					D1 and 
					D0
			)
		)
	);

	J <= not J_L;
	K <= not K_L;

	T <=
	(
		(EV and 
		(
			(--S0	
				not	D3 and 
				not	D2 and 
				not	D1 and 
				not	D0
			)
			or
			(--S1	
				not	D3 and 
				not	D2 and 
				not	D1 and 
					D0
			)
			or
			(--S2	
				not	D3 and 
				not	D2 and 
					D1 and 
				not	D0
			)
			or
			(--S3
				not	D3 and 
				not	D2 and 
					D1 and 
					D0
			)
			or
			(--S4
				not	D3 and 
					D2 and 
				not	D1 and 
				not	D0
			)
		))
		or
		(
			CW and
				(--S4 CW case
					not	D3 and 
						D2 and 
					not	D1 and 
					not	D0
				)
		)
		or
		(not EV and
			(--Red3 back to green
					D3 and 
					D2 and 
					D1 and 
					D0
			)
		)
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
		(
			EV and
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
			)
		)
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
		(
			not EV and 
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
			)
		)
		or
		(
			EV and
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
			)
		)
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
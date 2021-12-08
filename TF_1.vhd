LIBRARY ieee; 
	use ieee.std_logic_1164.ALL; 
	use ieee.std_logic_unsigned.all;
	use ieee.std_logic_arith.all;
	
entity  tf_controle_trafego is

port 

(

	clock : in std_logic;
	reset : in std_logic;
	
	s1    : out std_logic_vector(2 downto 0);
	s2    : out std_logic_vector(2 downto 0);
	sa	   : out std_logic_vector(1 downto 0);
	sb 	: out std_logic_vector(1 downto 0);
	da    : out std_logic_vector(6 downto 0);
	db    : out std_logic_vector(6 downto 0)

);
 
 end tf_controle_trafego;
 
 architecture Rafael_Holtz of tf_controle_trafego is
 
 signal cont: integer :=0;
 
 begin 
 
	process(clock, reset)
	begin
	
	if reset = '1' then
		cont <=0;
	else
		if clock 'event and clock = '1' then
			if cont < 16 then 
			  cont<=cont+1;
		else
			cont<=0;
			
			end if;
		end if;
	end if;
	 
	end process;
	
	semaforos1:process(cont)
	begin 
	
	if cont <9 then 
		 s1<="001";
		elsif cont = 9 then
			s1<="010";
			else 
			  s1<="100";
	end if;
	
	end process semaforos1;
	
	semaforo2:process(cont)
	begin 
	
	if cont < 9 then 
		 s2<="100";
		elsif cont = 9 then
			s2<="100";
			else 
			  s2<="001";

	end if;
	end process semaforo2;
	
	
	
 end Rafael_Holtz;
 
 
 
 
 
 if s1<="100"  then 
		 sa<="10";
			else 
			  sa<="01";
	end if;
	
	
	
	if s2<="100"  then 
		 sa<="10";
			else 
			  sa<="01";
	end if;



	
	

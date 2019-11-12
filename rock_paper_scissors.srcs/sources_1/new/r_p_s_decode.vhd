library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity r_p_s_decode is
Port ( sel : in std_logic_vector(1 downto 0);
       sel_out : out STD_LOGIC_VECTOR (5 downto 0));
end r_p_s_decode;

architecture DataFlow of r_p_s_decode is

begin
    
	sel_out <= "011011" when sel = "00" else -- R
			   "011001" when sel = "01" else -- P
			   "011100" when sel = "10" else -- S
			   "111111";

end DataFlow;
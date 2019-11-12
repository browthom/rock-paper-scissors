library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity r_p_s_winner is
port (user1_sel, user2_sel : in std_logic_vector (1 downto 0);
      enable : in std_logic;
      winner : out std_logic_vector (1 downto 0));
end r_p_s_winner;

architecture DataFlow of r_p_s_winner is

begin

winner <= "01" when ((user1_sel = "01" and user2_sel = "00") or 
                     (user1_sel = "10" and user2_sel = "01") or 
                     (user1_sel = "00" and user2_sel = "10")) and enable = '1' else
                     
          "10" when ((user2_sel = "01" and user1_sel = "00") or 
                     (user2_sel = "10" and user1_sel = "01") or 
                     (user2_sel = "00" and user1_sel = "10")) and enable = '1' else
          "00";

end DataFlow;

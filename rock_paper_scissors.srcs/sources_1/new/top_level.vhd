library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity top_level is
port (clk, btnl, btnc, btnr : in std_logic;
      leds : out std_logic_vector (1 downto 0);
      seg_out : out std_logic_vector (7 downto 0);
	  anode_out : out std_logic_vector (3 downto 0));
end top_level;

architecture Structural of top_level is

component multiplexer_seven_segment_display is
port ( clk : in std_logic;
	   input_1, input_2, input_3, input_4 : in std_logic_vector (7 downto 0);
       seg_out : out std_logic_vector (7 downto 0);
	   anode_out : out std_logic_vector (3 downto 0));
end component;

component r_p_s_decode is
Port ( sel : in std_logic_vector(1 downto 0);
       sel_out : out std_logic_vector (5 downto 0));
end component;

component seven_segment_decoder is
port (input : in std_logic_vector (5 downto 0);
	  enable : in std_logic;
      seg_out : out std_logic_vector (7 downto 0));
end component;

component count_to_two is
port (clk, reset, enable, enable_auto_reset : in std_logic;
	  output : out std_logic_vector (1 downto 0));
end component;

component two_bit_select is
port (input_0, input_1, input_2 : in std_logic;
      sel_out : out std_logic_vector(1 downto 0));
end component;

component press_release_debouncer is
port (clk : in std_logic;
      button_press : in std_logic;
      output : out std_logic);
end component;

component var_clock_divider_2 is
port (clk : in std_logic;
	  divider : in natural range 0 to 25;
      clk_out : out std_logic);
end component;

component r_p_s_winner is
port (user1_sel, user2_sel : in std_logic_vector (1 downto 0);
      enable : in std_logic;
      winner : out std_logic_vector (1 downto 0));
end component;


signal rock_db_signal, paper_db_signal, scissors_db_signal : std_logic;
signal r_p_s_basys_signal, r_p_s_user_signal : std_logic_vector (1 downto 0);
signal basys_display_code, user_display_code : std_logic_vector (5 downto 0);
signal seg_a, seg_b : std_logic_vector (7 downto 0);
signal counter_enable, select_winner_enable : std_logic;
signal clk_div_out : std_logic;

begin

counter_enable <= '1' when rock_db_signal = '0' and paper_db_signal = '0' and scissors_db_signal = '0' else
                  '0';
                  
select_winner_enable <= not counter_enable;


clk_div: var_clock_divider_2 port map (clk => clk,
                                       divider => 20,
                                       clk_out => clk_div_out);

select_winner: r_p_s_winner port map (user1_sel => r_p_s_basys_signal,
                                      user2_sel => r_p_s_user_signal,
                                      enable => select_winner_enable,
                                      winner => leds);

rock_db: press_release_debouncer port map (clk => clk,
                                           button_press => btnl,
                                           output => rock_db_signal);
paper_db: press_release_debouncer port map (clk => clk,
                                            button_press => btnc,
                                            output => paper_db_signal);
scissors_db: press_release_debouncer port map (clk => clk,
                                               button_press => btnr,
                                               output => scissors_db_signal);

count_up: count_to_two port map (clk => clk_div_out, 
                                 reset => '0', 
                                 enable => counter_enable,
                                 enable_auto_reset => '1',
                                 output => r_p_s_basys_signal);

r_p_s_select: two_bit_select port map (input_0 => rock_db_signal, 
                                       input_1 => paper_db_signal, 
                                       input_2 => scissors_db_signal,
                                       sel_out => r_p_s_user_signal);

r_p_s_dec_1: r_p_s_decode port map (sel => r_p_s_basys_signal,
                                    sel_out => basys_display_code);
r_p_s_dec_2: r_p_s_decode port map (sel => r_p_s_user_signal,
                                    sel_out => user_display_code);
                                              
decode_1: seven_segment_decoder port map (input => basys_display_code,
                                          enable => '1',
                                          seg_out => seg_a);
decode_2: seven_segment_decoder port map (input => user_display_code,
                                          enable => select_winner_enable,
                                          seg_out => seg_b);
                                          
M1: multiplexer_seven_segment_display port map (clk => clk,
                                                input_1 => "11111111", 
                                                input_2 => "11111111", 
                                                input_3 => seg_b, 
                                                input_4 => seg_a,
                                                seg_out => seg_out,
                                                anode_out => anode_out);

end Structural;

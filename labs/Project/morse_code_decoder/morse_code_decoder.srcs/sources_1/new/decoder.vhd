------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

------------------------------------------------------------
-- Entity declaration for n-bit counter
------------------------------------------------------------
entity decoder is
    port(
        clk         : in std_logic;
        rst         : in std_logic;
        btnc_i      : in  std_logic;  -- Enable input
        over_flow_i : in  std_logic;
        cnt_i       : in  std_logic_vector(4 - 1 downto 0);
        shift_o     : out std_logic;
        char_o	    : out std_logic_vector(3 - 1 downto 0);
        dcd_o	    : out std_logic;
        rst_o       : out  std_logic
    );
end entity decoder;

architecture behavioral of decoder is

signal s_cnt_local : unsigned(3 - 1 downto 0);
signal s_shift_local : std_logic;
signal s_rst_o : std_logic;
begin    
    decoder : process(clk,btnc_i)
    begin
        if rising_edge(clk) then
            if (rst = '1') then
                s_cnt_local <= "000";
                s_shift_local <= '0';
                s_rst_o <= '0';
                dcd_o <= '0';
            end if;
        end if;
        
        if rising_edge(clk) then
            if (s_shift_local = '1') then
                s_shift_local <= '0';
            end if;
            if (s_rst_o = '1') then
                s_rst_o <= '0';
            end if;
        end if;
        
        if falling_edge(btnc_i) then
            if (cnt_i <= "0010") then
                dcd_o <= '0';
                s_cnt_local <= s_cnt_local + 1;
                s_rst_o <= '1';
                s_shift_local <= '1';
            elsif ("0010" < cnt_i and cnt_i < "0100") then
                dcd_o <= '1';
                s_cnt_local <= s_cnt_local + 1;
                s_rst_o <= '1';
                s_shift_local <= '1';
            elsif (cnt_i > "0100") then
                s_rst_o <= '1';
            end if;
            rst_o <= s_rst_o;
            shift_o <= s_shift_local;
            char_o <= std_logic_vector(s_cnt_local);
        end if;
        rst_o <= s_rst_o;
        shift_o <= s_shift_local;
        char_o <= std_logic_vector(s_cnt_local);
    end process decoder;

    
end architecture behavioral;
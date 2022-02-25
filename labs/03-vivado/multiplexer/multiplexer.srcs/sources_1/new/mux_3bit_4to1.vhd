------------------------------------------------------------
--
-- Example of 2-bit binary comparator using the when/else
-- assignments.
-- EDA Playground
--
-- Copyright (c) 2020-Present Tomas Fryza
-- Dept. of Radio Electronics, Brno Univ. of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------
-- Entity declaration for 2-bit binary comparator
------------------------------------------------------------
entity mux_3bit_4to1 is
    port(
        d_i           : in  std_logic_vector(3 - 1 downto 0);
        c_i           : in  std_logic_vector(3 - 1 downto 0);
        b_i           : in  std_logic_vector(3 - 1 downto 0);
		a_i           : in  std_logic_vector(3 - 1 downto 0);
		sel_i         : in  std_logic_vector(2 - 1 downto 0);

        -- COMPLETE THE ENTITY DECLARATION


        f_o    : out std_logic_vector(3 - 1 downto 0)  -- B is greater than A
        
    );
end entity mux_3bit_4to1;

------------------------------------------------------------
-- Architecture body for 2-bit binary comparator
------------------------------------------------------------
architecture Behavioral of mux_3bit_4to1 is
begin


    -- WRITE "GREATER" AND "EQUALS" ASSIGNMENTS HERE


    with sel_i select
        f_o <=  a_i when "000",  -- If addr_i = "000" then y_o = a_i
                b_i when "001",
                c_i when "010",
                d_i when others; -- All other combinations
    
end architecture Behavioral;
